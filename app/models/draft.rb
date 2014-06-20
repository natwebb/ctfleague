class Draft < ActiveRecord::Base
  belongs_to :league
  has_many :available_tokens
  has_many :tokens, through: :available_tokens
  has_many :snake_positions
  has_many :users, through: :snake_positions

  def generate_soldiers
    @league = League.find(self.league_id)
    @league.memberships.length.times do
      8.times do
        token = Token.new
        unit = Unit.new
        soldier = Soldier.new
        soldier.set_starting_attributes
        unit.soldiers << soldier
        token.units << unit
        self.tokens << token
      end
    end
  end

  def generate_draft_order
    @league = League.find(self.league_id)
    @members = @league.users.shuffle

    position = 1
    @members.each do |member|
      self.snake_positions.create(:user => member, :position => position)
      position = position +1
    end

    self.current_position = 1
    self.save
  end

  def send_draft_beginning_emails
    @league = League.find(self.league_id)
    @snake_positions = self.snake_positions

    @snake_positions.each do |sp|
      DraftMailer.draft_beginning_email(@league, sp, self).deliver
    end
  end

  def increment_current_position
    if self.draft_reversed
      if self.current_position > 1
        self.current_position = self.current_position - 1
      else
        self.draft_reversed = false
      end
    else
      if self.current_position == self.snake_positions.length
        self.draft_reversed = true
      else
        self.current_position = self.current_position + 1
      end
    end

    self.save
  end
end
