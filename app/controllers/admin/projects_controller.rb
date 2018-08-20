class Admin::ProjectsController < Admin::ApplicationController
  def new
    @project = Project.new
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

  def destroy
    @project = Project.find(params[:id])
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
end
