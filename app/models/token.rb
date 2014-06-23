class Token < ActiveRecord::Base
  belongs_to :team
  has_one :available_token
  has_one :draft, through: :available_token
  has_many :units
  has_one :match_token
  has_one :match, through: :match_token

  scope :on_squad, -> { where(on_squad: true) }
  scope :off_squad, -> { where(on_squad: [false, nil]) }
end
