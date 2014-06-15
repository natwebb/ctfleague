class InvitesController < ApplicationController
  def send_invite
    LeagueMailer.invite_email(params[:emails], params[:league_id]).deliver
    redirect_to league_path(params[:league_id]), notice: "Your invites have been sent!"
  end
end
