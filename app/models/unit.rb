class Unit < ActiveRecord::Base
  belongs_to :token
  has_many :soldiers
end
