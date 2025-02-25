class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
  end

  def update
    @task.update(tasks_params)
    redirect_to tasks_path(@tasks)
  end

  def destroy
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
