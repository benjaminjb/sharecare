class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    invitation = Invitation.find(params[:id])
    if invitation.user_id == current_user.id
      # Roster.new(roster_params)
      roster = Roster.new(:team_id => invitation.team_id, :user_id => current_user.id, :role => "help")
      if roster.save
        invitation.destroy
        flash[:notice] = "Invitation for #{invitation.team.name} accepted."
      else
        flash[:alert] = "Unexpected error attempting to join team for #{invitation.team.name}."
      end
    else
      flash[:alert] = "You don't have permission to change that invitation."
    end
    redirect_to :back
  end

  def update
    invitation = Invitation.find(params[:id])
    if invitation.email == current_user.email
      invitation.open = false
      invitation.save
      flash[:notice] = "Invitation for #{invitation.team.name} rejected."
    else
      flash[:alert] = "You don't have permission to accept that invitation."
    end
    redirect_to :back
  end

  def create
    if check_parameters(params)
      invitation = Invitation.new(invitation_params)
      invitation.team_id = params[:id]
      invitation.open = true
      # invitation.user_id = nil
      # invitation.user_id is not necessary
      invitation.save  
      flash[:notice] = "Invitation sent to #{invitation.email}."
    else
      flash[:alert] = "You don't have permission to accept that invitation."
    end
    redirect_to :back
  end

  def check_parameters(params)
    !Invitation.all.map(&:email).include?(params[:invitation[:email]]) 
    &&
    Roster.find_by_team_id_and_user_id(params[:id], current_user.id)
  end

  private
  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
