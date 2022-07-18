require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, project_number: 17701) }

  before do
    login_as(user)
    assign_project_role!(user, :viewer, project)
  end

  scenario "with project details" do
    visit "/projects"
    click_link "17701"
    expect(page.current_url).to eq project_url(project)
  end

  scenario "unless they do not have permission" do
    FactoryBot.create(:project, project_number: 17701)
    visit "/projects"
    expect(page).to have_content 17701
  end
end
