require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario do
    visit "/"

    within all("div.ui.menu")[0] do
      click_link "Logout"
    end

    expect(page).to have_content "Signed out successfully."
  end
end