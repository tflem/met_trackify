module NotAuthorizedConcern
  extend ActiveSupport::Concern
  
  private

  def not_authorized
    flash[:alert] = "You Are Not Allowed To Do That."
    redirect_to root_path
  end
end