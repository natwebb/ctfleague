class Team < ActiveRecord::Base
  belongs_to :league
  has_many :tokens
  has_one :team_ownership
  has_one :user, through: :team_ownership

  validates_uniqueness_of :name

  def heal_bench_tokens
    self.tokens.off_squad.each do |token|
      soldier = token.units.last.soldiers.last
      soldier.damage = 0
      soldier.save
    end
  end
end
