class Team < ActiveRecord::Base
  belongs_to :league
  has_many :tokens
  has_one :team_ownership
  has_one :user, through: :team_ownership

  validates_uniqueness_of :name
end
