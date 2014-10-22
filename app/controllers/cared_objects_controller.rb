class CaredObjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @cared_objects = CaredObject.new
  end
  
  def create
    @cared_objects = CaredObject.new(cared_objects_params)
    if @cared_objects.save
      redirect_to "/teams/new"
    else
      flash[:error] = @cared_objects.errors.messages
      render "cared_object#new" #/ redirect_to :back
    end
  end

  # def edit
  #   @cared_object = CaredObject.find(params[:id])
  # end

  # def update
  #   @cared_object = CaredObject.find(params[:id])
  #   @cared_object.update(cared_object_params)
  #   redirect_to "/videos/#{@cared_object.video_id}"
  # end

  private
  def cared_objects_params
    params.require(:cared_objects).permit(:name)
  end
end
