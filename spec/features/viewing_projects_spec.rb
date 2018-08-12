require "rails_helper"

RSpec.feature "Users can view projects" do
  scenario "with project details" do
    project = FactoryBot.create(:project, project_number: 17701)

    visit "/projects"
    click_link 17701
    expect(page.current_url).to eq project_url(project)
  end
end