class MatchMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  scope :winner, -> { where(winner: true) }
end
