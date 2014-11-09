class TasksController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js


  
  
  def create
    roster = Sharecare::UseCases::LeaveTeam.run(roster_params, current_user.id)
    @roster_success = roster[:success?]
    @team_id = roster[:team_id]
    if roster[:success?]
      flash[:notice] = roster[:message]
    else
      flash[:alert] = roster[:message]
    end
  end

  def update
    roster = Sharecare::UseCases::LeaveTeam.run(roster_params, current_user.id)
    @roster_success = roster[:success?]
    @team_id = roster[:team_id]
    if roster[:success?]
      flash[:notice] = roster[:message]
    else
      flash[:alert] = roster[:message]
    end
  end

  def destroy
    roster = Sharecare::UseCases::LeaveTeam.run(roster_params, current_user.id)
    @roster_success = roster[:success?]
    @team_id = roster[:team_id]
    if roster[:success?]
      flash[:notice] = roster[:message]
    else
      flash[:alert] = roster[:message]
    end
  end
  
  private
  def roster_params
    params.require(:roster).permit(:id)
  end
end
