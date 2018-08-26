require "rails_helper"

RSpec.describe ProductPolicy do

  let(:user) { User.new }

  subject { described_class }  

  permissions :show? do
    let(:user) { FactoryBot.create :user }
    let(:product) { FactoryBot.create :product}

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, product)
    end  

    it "allows viewers of the product" do
      assign_product_role!(user, :viewer, product)
      expect(subject).to permit(user, product)
    end

    it "allows editors of the product" do
      assign_product_role!(user, :editor, product)
      expect(subject).to permit(user, product)
    end

    it "allows managers of the product" do
      assign_product_role!(user, :manager, product)
      expect(subject).to permit(user, product)
    end
    
    it "allows administrators" do
      admin = FactoryBot.create :user, :admin
      expect(subject).to permit(admin, product)
    end
  end  
end
