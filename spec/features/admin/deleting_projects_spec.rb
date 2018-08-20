require "rails_helper"

RSpec.feature "Users can delete projects" do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end
  
  scenario "successfully" do
    FactoryBot.create(:project, project_number: 17701)

    visit "/projects"
    click_link 17701
    click_link "Delete"

    expect(page).to have_content "Project Information Has Been Deleted."
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content 17701
  end
end