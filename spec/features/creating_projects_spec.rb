require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/projects"

    click_link "Project Time"

    fill_in "Project Number",	with: 15501
    fill_in "Project Name",	with: "Cleaning Update"
    fill_in "Project Time",	with: "4 Hours" 
    click_button "Create Project"  

    expect(page).to have_content "Project Information Created."  
  end
end