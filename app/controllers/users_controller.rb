class UsersController < ApplicationController
  before_action :authenticate_user! #, :except => [:index]
  
  def show
    @user = User.find(current_user.id)
  end
end
