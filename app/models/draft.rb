class Draft < ActiveRecord::Base
  belongs_to :league
  has_many :tokens

  def generate_soldiers(league_id)
    @league = League.find(league_id)
    @league.memberships.length.times do
      8.times do
        #token = Token.new
        #self.tokens << token
      end
    end
  end
end
