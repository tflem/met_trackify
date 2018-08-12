class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end  

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project Information Created."
      redirect_to @project
    else
      flash.now[:alert] = "Project Information Has Not Been Created."
      render "new"
    end
  end

  def new
    @project = Project.new
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

  def destroy
    @project.destroy

    flash[:notice] = "Project Information Has Been Deleted."
    redirect_to projects_path
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
    
