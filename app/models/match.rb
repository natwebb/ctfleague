class Match < ActiveRecord::Base
  belongs_to :league
  has_many :match_members
  has_many :users, through: :match_members

  def finish
    self.finished = true
    self.save
  end
end
