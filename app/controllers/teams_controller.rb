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
    @team = Sharecare::UseCases::ShowTeam.run(team_show_params["id"].to_i, current_user)
    if @team[:success?]
      @individual_claimed_tasks = @team[:claimed_tasks]
      @individual_overdue_tasks = @team[:overdue_tasks]
      @individual_active_tasks = @team[:active_tasks]
      @individual_completed_tasks = @team[:completed_tasks]
      flash[:notice] = "Welcome to the team page for #{@team[:team].name}"
    else
      flash[:alert] = "You don't have access to that team."
      redirect_to :back
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

  def team_show_params
    params.permit(:id)
  end
end