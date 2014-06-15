class Draft < ActiveRecord::Base
  belongs_to :league
  has_many :tokens

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
end
