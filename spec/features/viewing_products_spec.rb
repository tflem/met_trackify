require "rails_helper"

RSpec.feature "Users can view products" do
  let(:user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product, article_name: "Christmas Tree") }

  before do
    login_as(user)
    assign_product_role!(user, :viewer, product)
  end

  scenario "with product details" do
    visit "/"
    click_link "Christmas Tree"
    expect(page.current_url).to eq product_url(product)
  end

  scenario "unless they do not have permission" do
    FactoryBot.create(:product, article_name: "Hidden Info")
    visit "/"
    expect(page).not_to have_content "Hidden Info"
  end
end