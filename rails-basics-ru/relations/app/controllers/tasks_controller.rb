class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
    else
      redirect_to @task
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :user_id, :status_id)
  end
end
