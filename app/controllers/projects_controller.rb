class ProjectsController < ApplicationController
    
    def index
        @projects = Project.all.order(:id)
    end

    def edit
        set_project
    end

    def show
        set_project
    end

    def new
        @project = Project.new
    end
  
    def create
        project = current_user.projects.create(project_params)
        redirect_to projects_path
    end

    def update
        puts params
        project = Project.find(params[:id])
        project.update(project_params)
        redirect_to project_path
    end

    def destroy
        Project.find(params[:id]).destroy
        redirect_to projects_path
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :status, :description)
    end

end