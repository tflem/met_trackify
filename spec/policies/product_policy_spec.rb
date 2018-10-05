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

  context "permissions" do
    subject { ProductPolicy.new(user, product) }

    let(:user) { FactoryBot.create(:user) }
    let(:product) { FactoryBot.create(:product) }

    context "for anonymous users" do
      let(:user) { nil }

      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context "for viewers of the product info" do
      before { assign_product_role!(user, :viewer, product) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for editors of the product info" do
      before { assign_product_role!(user, :editor, product) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for managers of the product info" do
      before { assign_product_role!(user, :manager, product) }

      it { should permit_action :show }
      it { should permit_action :update }
    end    

    context "for administrators" do
      let(:user) { FactoryBot.create :user, :admin }

      it { should permit_action :show }
      it { should permit_action :update }
    end
  end 
end