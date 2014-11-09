class UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js
  
  def show
    @user = User.find(current_user.id)
    @pending_invites = Invitation.where(:email => current_user.email) #, :open => true)
    @teams = @user.teams.includes(:users, :rosters, :invitations)
  end
end