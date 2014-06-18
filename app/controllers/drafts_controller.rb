class DraftsController < ApplicationController
  def create
    @league = League.find(params[:league_id])

    @draft = Draft.new
    @league.drafts << @draft
    @league.active = true
    @league.save

    @draft.generate_soldiers
    @draft.generate_draft_order
    @draft.send_draft_beginning_emails

    redirect_to league_draft_path(@league.id, @draft.id)
  end

  def show
    @draft = Draft.find(params[:id])
    @league = League.find(@draft.league_id)
  end

  def choose
    @draft = Draft.find(params[:id])
    @draft.increment_current_position

    redirect_to league_draft_path(params[:league_id], params[:id])
  end
end
