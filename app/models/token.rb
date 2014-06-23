class Token < ActiveRecord::Base
  belongs_to :team
  has_one :available_token
  has_one :draft, through: :available_token
  has_many :units

  scope :on_squad, -> { where(on_squad: true) }
  scope :off_squad, -> { where(on_squad: [false, nil]) }
end
