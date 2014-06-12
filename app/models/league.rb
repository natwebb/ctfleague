class League < ActiveRecord::Base
  belongs_to :user
  has_many :teams
  has_many :seasons

  validates_presence_of :user
  validates_uniqueness_of :name

  scope :active, -> { where(active: true) }
end
