class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task successfully created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task successfully updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task successfully deleted'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be deleted'
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(%i[id name description status creator performer completed])
  end
end
