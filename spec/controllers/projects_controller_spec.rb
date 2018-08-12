require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project correctly" do
    get :show, params: { id: "notta" }
  
    expect(response).to redirect_to(projects_path)

    message = "The Project You Were Looking for Could Not Be Found."
    expect(flash[:alert]).to eq message
  end
end
