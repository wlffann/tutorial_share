require 'rails_helper'

RSpec.feature "Admin creates new category" do

  scenario "that saves with correct information" do
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)
    visit new_admin_category_path
    fill_in "category[name]", :with => "Carpentry"
    click_on "Create Category"

    expect(page).to have_content("Category created!")
    expect(page).to have_content("Carpentry")
  end

  scenario "that does not save with incorrect information" do
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)
    visit new_admin_category_path
    fill_in "category[name]", :with => "" 
    click_on "Create Category"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "but user cannot create category" do
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(false)
    visit new_admin_category_path

    expect(page).to have_content("You are not authorized to commit this action")
  end

end