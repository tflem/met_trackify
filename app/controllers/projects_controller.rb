class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end    

  def show
  end

  def edit
  end    

  def update
    if @project.update(project_params)
      flash[:notice] = "Project Information Has Been Updated."
      redirect_to @project
    else
      flash.now[:alert] = "Project Information Has Not Been Updated."
      render "edit"
    end
  end 

  private
    def project_params
      params.require(:project).permit(:project_number,
                                      :project_name,
                                      :project_time)
    end

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Project You Were Looking for Could Not Be Found."
      redirect_to projects_path
    end
end
    
