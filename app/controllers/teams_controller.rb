class TeamsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create
    team = Sharecare::UseCases::CreateTeam.run(team_params)
    if team[:success?]
      flash[:notice] = "Successfully created team for #{team.team.name}!"
      roster = Sharecare::UseCases::CreateRoster.run(team.team)
    else
      flash[:alert] = team[:error]
    end
  end

  def show
    @team = Team.includes(:tasks, :notes, :invitations).find(params[:id])
    # .where.not(users: { email: current_user.email }).find(params[:id])
    if @team.users.include?(current_user)
      @users = @team.users.where.not(:email => current_user.email)
    else
      flash[:alert] = "You don't have access to that team."
      redirect_to :back
    end
  end

  def destroy
    roster = Roster.find_by_team_id_and_user_id(params[:id], current_user.id)
    if roster
      roster.destroy
      redirect_to "index"
    else
      flash[:alert] = "You don't have permission to leave this team."
      redirect_to :back
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end