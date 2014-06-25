class MatchesController < ApplicationController
  def start
    @match = Match.find(params[:id])
    @league = League.find(params[:league_id])

    @team_1 = @match.users.first.teams.find_by_league_id(params[:league_id])
    @team_2 = @match.users.last.teams.find_by_league_id(params[:league_id])

    if @team_1.tokens.on_squad.length != 6 || @team_2.tokens.on_squad.length != 6
      redirect_to league_path(@league), alert: "Both teams must have 6 units on their current squads."
    else
      @team_1.tokens.on_squad.each do |token|
        @match.match_tokens.create(:token => token, :side => 1)
      end

      @team_2.tokens.on_squad.each do |token|
        @match.match_tokens.create(:token => token, :side => 2)
      end

      #for now!
      simulate_match
      finish
    end
  end

  def finish
    @match.finish

    @team_1.heal_bench_tokens
    @team_2.heal_bench_tokens

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
=begin
#Simple coin flip determines winner
    if Random.rand(1..2) == 1
      winning_member = @match.match_members.first
    else
      winning_member = @match.match_members.last
    end
=end
    winning_member = roto_winner
    winning_member.winner = true
    winning_member.save
  end

  def roto_winner
    #initialize variables
    team_1_aim = 0
    team_1_stealth = 0
    team_1_speed = 0
    team_1_sight = 0
    team_1_hardiness = 0
    team_2_aim = 0
    team_2_stealth = 0
    team_2_speed = 0
    team_2_sight = 0
    team_2_hardiness = 0

    #sums the stats for each team, this can probably be refactored with Reduce
    @team_1.tokens.on_squad.each do |token|
      soldier = token.units.first.soldiers.first
      team_1_aim = team_1_aim + soldier.aim
      team_1_stealth = team_1_stealth + soldier.stealth
      team_1_speed = team_1_speed + soldier.speed
      team_1_sight = team_1_sight + soldier.sight
      team_1_hardiness = team_1_hardiness + soldier.effective_hardiness
    end

    @team_2.tokens.on_squad.each do |token|
      soldier = token.units.first.soldiers.first
      team_2_aim = team_2_aim + soldier.aim
      team_2_stealth = team_2_stealth + soldier.stealth
      team_2_speed = team_2_speed + soldier.speed
      team_2_sight = team_2_sight + soldier.sight
      team_2_hardiness = team_2_hardiness + soldier.effective_hardiness
    end

    #compares each category
    @team_1_roto_points = 0
    @team_2_roto_points = 0
    head_to_head(team_1_aim, team_2_aim)
    head_to_head(team_1_stealth, team_2_stealth)
    head_to_head(team_1_speed, team_2_speed)
    head_to_head(team_1_sight, team_2_sight)
    head_to_head(team_1_hardiness, team_2_hardiness)

    if @team_1_roto_points > @team_2_roto_points
      winner = @match.match_members.first
    else
      winner = @match.match_members.last
    end

    winner
  end

  def head_to_head (team_1_stat, team_2_stat)
    #comparison totals the roto_points
    if team_1_stat > team_2_stat
      @team_1_roto_points += 1
    elsif team_2_stat > team_1_stat
      @team_2_roto_points +=1
    else
      #coin flip for tie breaker. This should be rare, since stats are out to 2 decimals.
      if Random.rand(1..2) == 1
        @team_1_roto_points += 1
      else
        @team_2_roto_points +=1
      end
    end
end
end
