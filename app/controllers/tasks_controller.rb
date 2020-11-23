class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy)
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end

  def index
  end
  
  private
  
    def task_params
      params.require(:task).permit(:name, :description)
    end
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
    end
end
