require "rails_helper"

RSpec.feature "Users can create new products" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Product"

    fill_in "Article Number",	with: 1001009741
    fill_in "Article Name",	with: "Christmas Tree"
    select DateTime.current.strftime("%Y"), from: "product[date_received(1i)]"
    select DateTime.current.strftime("%B"), from: "product[date_received(2i)]"
    select DateTime.current.strftime("%d"), from: "product[date_received(3i)]"
    fill_in "Article Location",	with: "15-003"
    click_button "Add New Product"     
    
    expect(page).to have_content "Product Information Created."  
  end
end