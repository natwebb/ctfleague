class Match < ActiveRecord::Base
  belongs_to :league
  has_many :match_members
  has_many :users, through: :match_members
  has_many :match_tokens
  has_many :tokens, through: :match_tokens

  scope :finished, -> { where(finished: true) }
  scope :active, -> { where(finished: [false, nil]) }

  def finish
    self.finished = true
    award_points
    self.save
  end

  private

  def award_points
    self.match_members.each do |match_member|
      if match_member.winner
        membership = self.league.memberships.find_by_user_id(match_member.user_id)
        membership.points = membership.points + 1
        membership.save
      end
    end
  end
end
