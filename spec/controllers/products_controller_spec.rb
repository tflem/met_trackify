require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  it "handles a missing product correctly" do
    get :show, params: {id: "notta"}

    expect(response).to redirect_to(products_path)

    message = "The Product You Were Looking for Could Not Be Found."
    expect(flash[:alert]).to eq message
  end
end
