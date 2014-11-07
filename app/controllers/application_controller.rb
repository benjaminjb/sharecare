class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  after_filter :discard_flash_if_xhr
  
  # after_filter :add_flash_to_header
 
  # def add_flash_to_header
    # only run this in case it's an Ajax request.
    # return unless request.xhr?
 
    # render "layouts/message_center"
    # make sure flash does not appear on the next page
    # flash.discard
  # end


  protected
  def discard_flash_if_xhr
    flash.discard if request.xhr?
  end

  def configure_devise_permitted_parameters
    registration_params = [:firstname, :lastname, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
