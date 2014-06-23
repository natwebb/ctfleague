class MatchesController < ApplicationController
  def start
    @match = Match.find(params[:id])
    @league = League.find(params[:league_id])

    team_1 = @match.users.first.teams.find_by_league_id(params[:league_id])
    team_2 = @match.users.last.teams.find_by_league_id(params[:league_id])

    if team_1.tokens.on_squad.length != 6 || team_2.tokens.on_squad.length != 6
      redirect_to league_path(@league), alert: "Both teams must have 6 units on their current squads."
    else
      team_1.tokens.on_squad.each do |token|
        @match.match_tokens.create(:token => token, :side => 1)
      end

      team_2.tokens.on_squad.each do |token|
        @match.match_tokens.create(:token => token, :side => 2)
      end

      #for now!
      simulate_match
      finish
    end
  end

  def finish
    @match.finish
    @league.check_for_end_of_round

    redirect_to league_path(@league), notice: "The match has been finished."
  end

  private

  def simulate_match
    @match.tokens.each do |token|
      soldier = token.units.first.soldiers.first
      soldier.damage = soldier.damage + 1
      soldier.save
    end

    if Random.rand(1..2) == 1
      winning_member = @match.match_members.first
    else
      winning_member = @match.match_members.last
    end

    winning_member.winner = true
    winning_member.save
  end
end
