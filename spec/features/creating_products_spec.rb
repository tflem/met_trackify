require "rails_helper"

RSpec.feature "Users can create new products" do
  before do
    visit "/"

    click_link "New Product"
  end

  scenario "with valid attributes" do
    fill_in "Article Number",	with: 1001009741
    fill_in "Article Name",	with: "Christmas Tree"
    fill_in "Date Received", with: DateTime.current.strftime("%B%d%Y")
    fill_in "Article Location",	with: "15-003"
    click_button "Create Product"     
    
    expect(page).to have_content "Product Information Created."
    
    product = Product.find_by(article_name: "Christmas Tree")
    expect(page.current_url).to eq product_url(product)

    title = "Christmas Tree - Product Summary - Met Trackify"
    expect(page).to have_title title
  end
  
  scenario "when providing invalid attributes" do
    click_button "Create Product"

    expect(page).to have_content "Product Information Has Not Been Created."
    expect(page).to have_content "Article number can't be blank"
    expect(page).to have_content "Article name can't be blank"
    expect(page).to have_content "Article location can't be blank"
  end
end