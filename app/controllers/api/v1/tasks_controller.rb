class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    render json: @tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
    render json: @task
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :completed, :user_id)
  end
end
