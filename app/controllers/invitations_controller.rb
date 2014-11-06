class InvitationsController < ApplicationController
  before_action :authenticate_user!
  # before_action :all_invitations, only: [:index, :create]
  respond_to :html, :js

  def create
    invitation = Sharecare::UseCases::CreateInvitation.run(invitation_params)
    if invitation[:success?]
      flash[:notice] = "Invitation sent to #{invitation[:email]}."
      @invitation = invitation[:invite]

    else
      flash[:alert] = invitation[:error]
      @error = invitation[:error]
    end
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

  def destroy
    # transaction script
    invitation = Invitation.find(params[:id])
    if invitation.email == current_user.email
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

  private
  def invitation_params
    params.require(:invitation).permit(:email, :team_id)
  end
end