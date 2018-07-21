require "rails_helper"

RSpec.feature "Users can create new products" do
  before do
    visit "/"

    click_link "New Product"
  end

  scenario "with valid attributes" do
    fill_in "Article Number",	with: 1001009741
    fill_in "Article Name",	with: "Christmas Tree"
    select DateTime.current.strftime("%Y"), from: "product[date_received(1i)]"
    select DateTime.current.strftime("%B"), from: "product[date_received(2i)]"
    select DateTime.current.strftime("%d"), from: "product[date_received(3i)]"
    fill_in "Article Location",	with: "15-003"
    click_button "Add New Product"     
    
    expect(page).to have_content "Product Information Created."
    
    product = Product.find_by(article_name: "Christmas Tree")
    expect(page.current_url).to eq product_url(product)

    title = "Christmas Tree - Products - Met Trackify"
    expect(page).to have_title title
  end
  
  scenario "when providing invalid attributes" do
    click_button "Add New Product"

    expect(page).to have_content "Product Information Has Not Been Created."
    expect(page).to have_content "Article number can't be blank"
    expect(page).to have_content "Article name can't be blank"
    expect(page).to have_content "Article location can't be blank"
  end
end