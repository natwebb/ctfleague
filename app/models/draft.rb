class Draft < ActiveRecord::Base
  belongs_to :league
  has_many :tokens
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

    self.snake_positions.each do |sp|
      puts sp.position
    end
  end
end
