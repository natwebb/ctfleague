class RoundRobin < ActiveRecord::Base
  belongs_to :league
  has_many :round_robin_members
  has_many :users, through: :round_robin_members
end
