require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "with valid credentials" do
    visit "/"

    within all("div.ui.menu")[0] do
      click_link "Login"
    end

    fill_in "Email",	with: user.email
    fill_in "Password",	with: "password"
    click_button "Log In"
    
    
    expect(page).to have_content "Logged In Successfully."
    expect(page).to have_content "Logged In As #{user.email}"
  end
end