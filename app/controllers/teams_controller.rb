class TeamsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.new(team_params)
    if team.save
      session[:team_id] = team.id
      flash[:message] = "Successfully created team for #{team.name}!"
      redirect_to "/teams/#{@team.id}" #show
    else
      flash[:message] = @team.errors.messages
      redirect_to "index"
    end
  end

  def show
    @team = Team.find(params[:id])
    if @team.users.include?(current_user)
      @tasks = @team.tasks
      @notes = @team.notes
      @pending = @team.invitations
      @users = @team.users.where.not(:email => current_user.email)
    else
      flash[:message] = "You don't have access to that team."
      redirect_to :back
    end
  end

  def destroy
    roster = Roster.find_by_team_id_and_user_id(params[:id], current_user.id)
    if roster
      roster.destroy
      redirect_to "index"
    else
      flash[:message] = "You don't have permission to leave this team."
      redirect_to :back
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

end
