class Match < ActiveRecord::Base
  belongs_to :league
  has_many :match_members
  has_many :users, through: :match_members
  has_many :match_tokens
  has_many :tokens, through: :match_tokens

  scope :finished, -> { where(finished: true) }
  scope :active, -> { where(finished: [false, nil]) }

  def finish
    self.finished = true
    self.save
  end
end
