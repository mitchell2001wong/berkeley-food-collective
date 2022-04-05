class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end

  def clear
    Task.clear_tasks
    redirect_to tasks_path
  end

  def checkmark
    @task = Task.find(params[:task.to_i])
    @task.completed = !@task.completed
    redirect_to tasks_path
  end

  def new; end

  def create
    redirect_to tasks_path
  end
end
