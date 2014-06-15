class LeagueTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :league
end
