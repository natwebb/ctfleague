class League < ActiveRecord::Base
  belongs_to :user
  has_many :teams

  validates_presence_of :user
  validates_uniqueness_of :name

  scope :active, -> { where(active: true) }
end
