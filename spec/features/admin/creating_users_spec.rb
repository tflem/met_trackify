require "rails_helper"

RSpec.feature "Admins can create new users" do
  let(:admin) { FactoryBot.create(:user, :admin) }

  before do
    login_as(admin)
    visit "/"

    within all("div.ui.menu")[0] do
      click_link "Admin"
    end

    click_link "Users"
    click_link "Add New User"
  end

  scenario "with valid credentials" do
    fill_in "Email",	with: "newb@example.com"
    fill_in "Password",	with: "password"
    click_button "Create User"
    expect(page).to have_content "User Has Been Created."
  end

  scenario "with invalid credentials" do
    fill_in "Email", with: ""
    fill_in "Password",	with: "password"
    click_button "Create User"

    expect(page).to have_content "User Has Not Been Created."
  end

  scenario "when the new user is an admin" do
    fill_in "Email",	with: "admin@example.com"
    fill_in "Password",	with: "password"
    check "Is an admin?"
    click_button "Create User"
    expect(page).to have_content "User Has Been Created."
    expect(page).to have_content "admin@example.com (Admin)"
  end
end
