class Team < ActiveRecord::Base
  belongs_to :league

  validates_uniqueness_of :name
end
