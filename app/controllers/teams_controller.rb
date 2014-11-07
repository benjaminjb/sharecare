class TeamsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create
    team = Sharecare::UseCases::CreateTeam.run(team_params)
    if team[:success?]
      @team = team[:team]
      roster = Sharecare::UseCases::CreateRoster.run(@team, current_user.id, "primary")
      flash[:notice] = "Successfully created team for #{@team.name}!"        
    else
      flash[:alert] = team[:error]
    end
  end

  def destroy
    destroy_team = Sharecare::UseCases::DestroyTeam.run(params[:id], current_user.id)
    @team_id = params[:id]
    if destroy_team[:success?]
      @destroy_team = true
      flash[:notice] = destroy_team[:message]
    else
      @destroy_team = false
      flash[:alert] = destroy_team[:message]
    end
  end

  def show
    @team = Team.includes(:tasks, :invitations, :rosters).find(params[:id])
    if @team.users.include?(current_user)
      @users = @team.users.where.not(:email => current_user.email)
    else
      flash[:alert] = "You don't have access to that team."
      redirect_to :back
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end