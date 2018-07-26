require "rails_helper"

RSpec.feature "Users can view products" do
  scenario "with product details" do
    product = FactoryBot.create(:product, article_name: "Christmas Tree")

    visit "/"
    click_link "Christmas Tree"
    expect(page.current_url).to eq product_url(product)
  end
end