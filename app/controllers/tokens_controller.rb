class TokensController < ApplicationController
  def update
    @team = Team.find(params[:team_id])
    if params[:commit] == "Add" && @team.tokens.on_squad.length == 6
      flash[:alert] = "You may only have 6 tokens on a squad."
      redirect_to league_team_path(params[:league_id], params[:team_id])
    else
      @token = Token.find(params[:id])
      @token.on_squad = params[:token][:on_squad]
      @token.save
      redirect_to league_team_path(params[:league_id], params[:team_id])
    end
  end
end
