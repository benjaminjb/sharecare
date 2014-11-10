class TasksController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create
    task = Sharecare::UseCases::CreateTask.run(task_params)
    @task_success = task[:success?]
    if task[:success?]
      @task = task[:task]
      flash[:notice] = task[:message]
    else
      flash[:alert] = task[:message]
    end
  end

  def update
    task = Sharecare::UseCases::ModifyTask.run(params[:id], params[:change], current_user.id)
    @task_success = task[:success?]
    @task_id = task[:task_id]
    if task[:success?]
      @task_change = task[:change]
      @task = task[:task]
      flash[:notice] = task[:message]
    else
      flash[:alert] = task[:message]
    end
  end

  def edit
    task = Sharecare::UseCases::RetrieveToAlterTask.run(params[:id], current_user.id)
    @task_success = task[:success?]
    @task_id = task[:task_id]
    if task[:success?]
      @task = task[:task]
      flash[:notice] = task[:message]
    else
      flash[:alert] = task[:message]
    end
  end

  def destroy
    task = Sharecare::UseCases::DestroyTask.run(params[:id], current_user.id)
    @task_success = task[:success?]
    @task_id = task[:task_id]
    if task[:success?]
      flash[:notice] = task[:message]
    else
      flash[:alert] = task[:message]
    end
  end
  
  private
  def task_params
    params.require(:task).permit(:task, :starttime, :endtime, :notes, :team_id)
  end
end