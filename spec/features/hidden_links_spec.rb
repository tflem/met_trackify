require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:product) { FactoryBot.create(:product) }
  let(:project) { FactoryBot.create(:project) }
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) }  

  context "non-admin users (product and project viewers)" do
    before do
      login_as(user)
      assign_product_role!(user, :viewer, product)
      assign_project_role!(user, :viewer, project)
    end

    scenario "cannot see the New Product link on index page" do
      visit "/"
      expect(page).not_to have_link "Add New Product"
    end

    scenario "cannot see the New Product link on show page" do
      visit product_path(product)
      expect(page).not_to have_link "Add New Product"
    end

    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete"
    end

    scenario "cannot see the New Project link on index page" do
      visit "/projects"
      expect(page).not_to have_link "Add New Project"
    end  

    scenario "cannot see the New Project link on show page" do
      visit project_path(project)
      expect(page).not_to have_link "Add New Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      expect(page).not_to have_link "Delete"
    end

    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Edit Product"
    end 

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      expect(page).not_to have_link "Edit Project"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Product link on index page" do
      visit "/"
      expect(page).to have_link "Add New Product"
    end

    scenario "can see the New Product link on show page" do
      visit product_path(product)
      expect(page).to have_link "Add New Product"
    end

    scenario "can see the Delete Product link" do
      visit product_path(product)
      expect(page).to have_link "Delete"
    end

    scenario "can see the New Project link on index page" do
      visit "/projects"
      expect(page).to have_link "Add New Project"
    end  

    scenario "can see the New Project link on show page" do
      visit project_path(project)
      expect(page).to have_link "Add New Project"
    end  

    scenario "can see the Delete Project link" do
      visit project_path(project)
      expect(page).to have_link "Delete"
    end

    scenario "can see the Edit Product link" do
      visit product_path(product)
      expect(page).to have_link "Edit Product"  
    end

    scenario "can see the Edit Project link" do
      visit project_path(project)
      expect(page).to have_link "Edit Project"
    end
  end
end