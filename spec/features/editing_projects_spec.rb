require "rails_helper"

RSpec.feature "Users can edit existing projects" do  
  before do
    FactoryBot.create(:project, project_number: 17701)

    visit "/projects"
    click_link 17701
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Project Number",	with: 17702
    click_button "Update Project"

    expect(page).to have_content "Project Information Has Been Updated."
    expect(page).to have_content 17702
  end

  scenario "with invalid attributes" do
    fill_in "Project Number",	with: ""
    click_button "Update Project"
    
    expect(page).to have_content "Project Information Has Not Been Updated."
  end 
end
     