class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
end
