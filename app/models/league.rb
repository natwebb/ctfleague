class League < ActiveRecord::Base
  belongs_to :commissioner, :class_name => :User, :foreign_key => 'user_id'
  has_many :teams
  has_many :seasons
  has_many :drafts
  has_many :memberships
  has_many :users, through: :memberships
  has_many :round_robins
  has_many :matches

  validates_presence_of :commissioner
  validates_uniqueness_of :name

  scope :active, -> { where(active: true) }

  after_create :generate_league_key

  def generate_round_robin
    @members = self.users.shuffle
    @round_robin = self.round_robins.create(:round => 1)

    position = 1
    @members.each do |member|
      @round_robin.round_robin_members.create(:user => member, :position => position)
      position = position + 1
    end

    generate_matches
  end

  def generate_matches
    @round_robin = self.round_robins.last
    @members = @round_robin.round_robin_members
    @length = @members.length

    @members.each do |member|
      if member.position <= (@length/2)
        @match = self.matches.create
        @match.season = self.season
        @match.users << member.user
        @match.users << @members.find_by_position(@length + 1 - member.position).user
        @match.save
      end
    end
  end

  def check_for_end_of_round
    @round_robin = self.round_robins.last

    end_of_round = true
    self.matches.each do |match|
      end_of_round = false if !match.finished
    end

    check_for_end_of_tournament if end_of_round
  end

  def check_for_end_of_tournament
    @round_robin = self.round_robins.last

    if @round_robin.round == (@round_robin.round_robin_members.length - 1)
      end_tournament
    else
      iterate_round_robin
      generate_matches
    end
  end

  def iterate_round_robin
    @round_robin = self.round_robins.last
    @members = @round_robin.round_robin_members

    @members.each do |member|
      if member.position > 1
        if member.position == @members.length
          member.position = 2
        else
          member.position = member.position + 1
        end
      end
      member.save
    end

    @round_robin.round = @round_robin.round + 1
    @round_robin.save
  end

  def end_tournament
    self.season = self.season + 1
    self.active = false
    self.save
  end

  private

  def generate_league_key
    league_key = ('a'..'z').to_a.shuffle[0,8].join
    self.league_key = league_key
    self.save
  end
end
