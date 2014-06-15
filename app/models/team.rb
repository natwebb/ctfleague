class Team < ActiveRecord::Base
  belongs_to :user
  has_many :tokens

  validates_uniqueness_of :name
end
