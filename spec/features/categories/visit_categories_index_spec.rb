require 'rails_helper'

RSpec.feature "At the categories index" do
  scenario "visitor can see all categories" do
    category = create(:category)
    visit categories_path

    expect(page).to have_content(category.name)
  end

  scenario "admin can create new category" do
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)
    visit categories_path
    click_on("New Category")
    fill_in "category[name]", :with => "Carpentry"
    click_on "Create Category"

    expect(page).to have_content("Carpentry")
    expect(current_path).to eq(category_path(Category.last))
  end

  scenario "visitor cannot create new category" do
    visit categories_path

    expect(page).to_not have_content("New Category")
  end

  scenario "user cannot create new category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(false)
    visit categories_path

    expect(page).to_not have_content("New Category")
  end

end