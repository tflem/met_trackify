class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end  

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project Information Created."
      redirect_to @project
    else
      # notta yet
    end
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:project_number,
                                       :project_name,
                                       :project_time)
    end
end
    
