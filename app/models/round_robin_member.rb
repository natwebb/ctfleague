class RoundRobinMember < ActiveRecord::Base
  belongs_to :round_robin
  belongs_to :user
end
