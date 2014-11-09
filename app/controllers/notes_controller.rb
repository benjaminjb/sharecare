class NotesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js
  
end
