class Token < ActiveRecord::Base
  belongs_to :team
  has_one :available_token
  has_one :draft, through: :available_token
  has_many :units
end
