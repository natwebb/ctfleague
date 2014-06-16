class Token < ActiveRecord::Base
  belongs_to :draft
  has_many :units
end
