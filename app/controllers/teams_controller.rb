class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to "/teams/#{@team.id}"
    else
      @teams = Team.all
      flash[:error] = @team.errors.messages
      render "index"
    end
  end

  def show
    
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

end
