class UsersController < ApplicationController
  before_action :authenticate_user! #, :except => [:index]
  
  def show
    @user = User.find(current_user.id)
    @pending_invites = Invitation.where("email = ? AND open = ?", current_user.email, true)
  end
end
