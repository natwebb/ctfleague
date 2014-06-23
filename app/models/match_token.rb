class MatchToken < ActiveRecord::Base
  belongs_to :token
  belongs_to :match
end
