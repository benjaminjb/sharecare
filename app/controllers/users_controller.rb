class UsersController < ApplicationController
  before_action :authenticate_user! #, :except => [:index]
  
  def show
    @user = User.includes(:invitations).find(current_user.id)
    @pending_invites = @user.invitations.select do |invite| 
      invite.email == current_user.email && invite.open == true
    end
  end
end
