class DraftsController < ApplicationController
  def create
    @league = League.find(params[:league_id])

    if @league.users.length%2 == 1
      flash[:alert] = "You must have an even number of members to begin the draft."
      redirect_to league_path(@league)
    else
      @draft = Draft.new
      @draft.season = @league.season
      @draft.save
      @league.drafts << @draft
      @league.active = true
      @league.drafting = true
      @league.save

      @draft.generate_soldiers
      @draft.generate_draft_order
      @draft.send_draft_beginning_emails

      redirect_to league_draft_path(@league.id, @draft.id)
    end
  end

  def show
    @draft = Draft.find(params[:id])
    @league = League.find(@draft.league_id)
  end

  def choose
    @league = League.find(params[:league_id])
    @token = Token.find(params[:token_id])
    @draft = Draft.find(params[:id])

    @draft.increment_current_position
    @team = current_user.teams.find_by_league_id(params[:league_id])

    @team.tokens << @token
    @draft.tokens.delete(@token)

    if @draft.tokens.length == 0
      @league.drafting = false
      @league.save
      @league.generate_round_robin
      redirect_to league_path(@league.id)
    else
      redirect_to league_draft_path(params[:league_id], params[:id])
    end
  end
end
