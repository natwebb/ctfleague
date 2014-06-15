class DraftsController < ApplicationController
  def new
    @draft = Draft.new
  end

  def create
    @league = League.find(params[:league_id])

    @draft = Draft.new
    @league.drafts << @draft
    @league.active = true
    @league.save

    @draft.generate_soldiers

    redirect_to draft_path(@draft.id)
  end

  def show
    @draft = Draft.find(params[:id])
    @league = League.find(@draft.league_id)
  end
end
