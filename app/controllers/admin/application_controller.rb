class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  skip_after_action :verify_authorized, :verify_policy_scoped
  
  def index
  end

  private
    
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "You Must Be An Admin To Do That."
        redirect_to root_path
      end
    end
end
