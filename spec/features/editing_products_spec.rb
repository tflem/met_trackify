require "rails_helper"

RSpec.feature "Managers can edit existing product info" do
  let(:user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product, article_name: "Christmas Tree") }

  before do
    login_as(user)
    assign_product_role!(user, :manager, product)

    visit "/"
    click_link "View Article Info"

    click_link "Christmas Tree"
    click_link "Edit Product"
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