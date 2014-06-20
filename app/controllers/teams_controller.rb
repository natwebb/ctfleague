class TeamsController < ApplicationController
  def new
    @league = League.find(params[:league_id])
    @new_team = @league.teams.build
  end

  def create
    @league = League.find(params[:league_id])
    @team = @league.teams.build(team_params)
    if @team.save
      current_user.teams << @team
      redirect_to league_path(@league), notice: "Your team has been created!"
    else
      flash[:alert] = "Your team could not be created."
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
