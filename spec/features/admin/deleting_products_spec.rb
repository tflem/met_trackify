require "rails_helper"

RSpec.feature "Users can delete products" do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end

  scenario "successfully" do
    FactoryBot.create(:product, article_name: "Christmas Tree")

    visit "/"
    click_link "View Article Info"

    click_link "Christmas Tree"
    click_link "Delete"

    expect(page).to have_content "Product Has Been Deleted."
    expect(page.current_url).to eq products_url
    expect(page).to have_no_content "Christmas Tree"
  end
end
