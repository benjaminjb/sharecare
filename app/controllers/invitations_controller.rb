class InvitationsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create
    invitation = Sharecare::UseCases::CreateInvitation.run(invitation_params)
    @team_id = invitation[:team_id]
    if invitation[:success?]
      @invitation = invitation[:invite]
      flash[:notice] = "Invitation sent to #{@invitation[:email]}."
    else
      flash[:alert] = invitation[:error]
    end
  end

  def destroy
    updated_invitation = Sharecare::UseCases::ModifyInvitation.run(params[:id], params[:join], current_user.email, current_user.id)
    @updated = updated_invitation[:success?]
    @invite_id = updated_invitation[:invite_id]
    if updated_invitation[:success?]
      flash[:notice] = updated_invitation[:message]
    else
      flash[:alert] = updated_invitation[:message]
    end
    if updated_invitation[:team]
      @team = updated_invitation[:team]
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:email, :team_id)
  end
end
