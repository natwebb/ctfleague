class LeaguesController < ApplicationController
  def new
    @league = League.new
  end

  def create
    @league = current_user.leagues.build(league_params)
    if @league.save
      redirect_to league_path(@league.id), notice: "Your league has been created!"
    else
      flash[:alert] = "Your league could not be created."
      render :new
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def show
    @league = League.find(params[:id])
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
