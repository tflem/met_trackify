require "rails_helper"

RSpec.feature "Users can edit existing products" do
  scenario "with valid attributes" do
    FactoryBot.create(:product, article_name: "Christmas Tree")

    visit "/"
    click_link "Christmas Tree"
    click_link "Edit Product"
    fill_in "Article Name",	with: "Talking Christmas Tree"
    click_button "Update Product"
    
    expect(page).to have_content "Product Has Been Updated."
    expect(page).to have_content "Talking Christmas Tree"
  end
end