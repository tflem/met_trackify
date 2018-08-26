require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project correctly" do
    get :show, params: { id: "notta" }
  
    expect(response).to redirect_to(projects_path)

    message = "The Project You Were Looking for Could Not Be Found."
    expect(flash[:alert]).to eq message
  end

  it "handles permission errors by redirecting to a safe place" do
    allow(controller).to receive(:current_user)

    project = FactoryBot.create(:project)
    get :show, params: { id: project }

    expect(response).to redirect_to(root_path)
    message = "You Are Not Allowed To Do That."
    expect(flash[:alert]).to eq message
  end
end
