require "rails_helper"

RSpec.feature "Users can create new projects" do
  before do
    login_as(FactoryBot.create(:user, :admin))
    visit "/"

    click_link "Add Project Time"
  end

  scenario "with valid attributes" do
    fill_in "Project Number",	with: 15501
    fill_in "Project Name",	with: "Cleaning Update"
    fill_in "Project Time",	with: "4 Hours"
    click_button "Create Project"

    expect(page).to have_content "Project Information Created."

    project = Project.find_by(project_name: "Cleaning Update")
    expect(page.current_url).to eq project_url(project)

    title = "Cleaning Update - Project Summary - Met Trackify"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Project"

    expect(page).to have_content "Project Information Has Not Been Created."
    expect(page).to have_content "Project number can't be blank"
    expect(page).to have_content "Project name can't be blank"
    expect(page).to have_content "Project time can't be blank"
  end
end
