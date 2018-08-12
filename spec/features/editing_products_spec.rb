require "rails_helper"

RSpec.feature "Users can edit existing products" do
  before do
    FactoryBot.create(:product, article_name: "Christmas Tree")

    visit "/"
    click_link "Christmas Tree"
    click_link "Edit"
  end

  scenario "with valid attributes" do
    fill_in "Article Name",	with: "Talking Christmas Tree"
    click_button "Update Product"
    
    expect(page).to have_content "Product Has Been Updated."
    expect(page).to have_content "Talking Christmas Tree"
  end

  scenario "when providing invalid attributes" do
    fill_in "Article Name",	with: ""
    click_button "Update Product" 

    expect(page).to have_content "Product Has Not Been Updated."
  end
end