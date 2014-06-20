class AvailableToken < ActiveRecord::Base
  belongs_to :draft
  belongs_to :token
end
