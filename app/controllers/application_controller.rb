class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: [:index],
  unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index], 
  unless: :devise_controller?
  include NotAuthorizedConcern
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized 
end
