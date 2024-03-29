require "rails_helper"

RSpec.describe ProjectPolicy do
  let(:user) { User.new }

  subject { described_class }

  context "policy_scope" do
    subject { Pundit.policy_scope(user, Project) }

    let!(:project) { FactoryBot.create :project }
    let(:user) { FactoryBot.create :user }

    it "is empty for anonymous users" do
      expect(Pundit.policy_scope(nil, Project)).to be_empty
    end

    it "includes projects a user is allowed to view" do
      assign_project_role!(user, :viewer, project)
      expect(subject).to include(project)
    end

    it "does not include projects a user is not allowed to view" do
      expect(subject).to be_empty
    end

    it "returns all projects for admins" do
      user.admin = true
      expect(subject).to include(project)
    end
  end

  context "permissions" do
    subject { ProjectPolicy.new(user, project) }

    let(:user) { FactoryBot.create(:user) }
    let(:project) { FactoryBot.create(:project) }

    context "for anonymous users" do
      let(:user) { nil }

      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context "for viewers of the project info" do
      before { assign_project_role!(user, :viewer, project) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for editors of the project info" do
      before { assign_project_role!(user, :editor, project) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for managers of the project info" do
      before { assign_project_role!(user, :manager, project) }

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
