class DraftsController < ApplicationController
  def create
    @league = League.find(params[:league_id])

    @draft = Draft.new
    @league.drafts << @draft
    @league.active = true
    @league.save

    @draft.generate_soldiers

    redirect_to league_draft_path(@league.id, @draft.id)
  end

  def show
    @draft = Draft.find(params[:id])
    @league = League.find(@draft.league_id)
  end
end
