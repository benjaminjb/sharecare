class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    invitation = Invitation.find(params[:id])
    if invitation.user_id == current_user.id
      # Roster.new(roster_params)
      roster = Roster.new(:team_id => invitation.team_id, :user_id => current_user.id, :role => "help")
      if roster.save
        invitation.destroy
        flash[:message] = "Invitation for #{invitation.team.name} accepted."
      else
        flash[:message] = "Unexpected error attempting to join team for #{invitation.team.name}."
      end
    else
      flash[:message] = "You don't have permission to change that invitation."
    end
    redirect_to :back
  end

  def update
    invitation = Invitation.find(params[:id])
    if invitation.user_id == current_user.id
      invitation.open = false
      invitation.save
      flash[:message] = "Invitation for #{invitation.team.name} rejected."
    else
      flash[:message] = "You don't have permission to change that invitation."
    end
    redirect_to :back
  end

  def create
  end

  # private
  # def roster_params
  #   params.require(:roster).permit(:color)
  # end
end
