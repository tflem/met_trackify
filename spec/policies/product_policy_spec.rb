require "rails_helper"

RSpec.describe ProductPolicy do

  let(:user) { User.new }

  subject { described_class }  

  context "policy_scope" do
    subject { Pundit.policy_scope(user, Product) }

    let!(:product) { FactoryBot.create :product }
    let(:user) { FactoryBot.create :user }

    it "is empty for anonymous users" do
      expect(Pundit.policy_scope(nil, Product)).to be_empty
    end

    it "includes products a user is allowed to view" do
      assign_product_role!(user, :viewer, product)
      expect(subject).to include(product)
    end

    it "does not include products a user is not allowed to view" do
      expect(subject).to be_empty
    end

    it "returns all products for admins" do
      user.admin = true
      expect(subject).to include(product)
    end
  end  

  permissions :show? do
    let(:user) { FactoryBot.create :user }
    let(:product) { FactoryBot.create :product }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, product)
    end  

    it "allows viewers of the product info" do
      assign_product_role!(user, :viewer, product)
      expect(subject).to permit(user, product)
    end

    it "allows editors of the product info" do
      assign_product_role!(user, :editor, product)
      expect(subject).to permit(user, product)
    end

    it "allows managers of the product info" do
      assign_product_role!(user, :manager, product)
      expect(subject).to permit(user, product)
    end
    
    it "allows administrators" do
      admin = FactoryBot.create :user, :admin
      expect(subject).to permit(admin, product)
    end
  end  

  permissions :update? do
    let(:user) { FactoryBot.create :user }
    let(:product) { FactoryBot.create :product }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, product)
    end
    
    it "does not allow viewers of the product info" do
      assign_product_role!(user, :viewer, product)
      expect(subject).not_to permit(user, product)
    end  

    it "does not allow editors of the product info" do
      assign_product_role!(user, :editor, product)
      expect(subject).not_to permit(user, product)
    end 

    it "allows managers of the product info" do
      assign_product_role!(user, :manager, product)
      expect(subject).to permit(user, product)
    end 

    it "allows administrators" do
      admin = FactoryBot.create :user, :admin
      expect(subject).to permit(admin, product)
    end 
  end    
end