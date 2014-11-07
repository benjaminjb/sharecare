class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(current_user.id)
    @pending_invites = Invitation.where(:email => current_user.email, :open => true)
    @teams = @user.teams.includes(:users, :rosters).includes(:invitations)
  end
end