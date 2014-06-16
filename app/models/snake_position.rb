class SnakePosition < ActiveRecord::Base
  belongs_to :user
  belongs_to :draft
end
