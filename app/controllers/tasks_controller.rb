class TasksController < ApplicationController
    def index
        @tasks = Task.all.order(:id)
    end

    def edit
        @task = Task.find(params[:id])
        @project_id = params[:project_id]
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end
  
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.new(params.require(:task).permit(:name, :status, :task, :username, :created_at))
        @task.user_id = current_user.id
        @task.save
        redirect_to request.referrer
    end

    def update
        task = Task.find(params[:id])
        task.update(task_params)
        redirect_to project_path(params[:project_id])
    end

    def destroy
        Task.find(params[:id]).destroy
        redirect_to request.referrer
    end

    private
    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :status, :task)
    end
end
