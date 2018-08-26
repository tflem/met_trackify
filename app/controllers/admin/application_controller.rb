class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  
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
