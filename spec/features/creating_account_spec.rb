require "rails_helper"

RSpec.feature "Users can create account" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Create Account"
    fill_in "Email", with: "test@mettrackify.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    expect(page). to have_content("Welcome! Your Account Has Been Created.")
  end
end
