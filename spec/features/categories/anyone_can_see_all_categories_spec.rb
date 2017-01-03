require 'rails_helper'

RSpec.feature "Visitor can view all categories" do

  scenario "by visiting the index" do
    category1, category2 = create_list(:category, 2)
    visit categories_path

    expect(page).to have_content(category2.name)
  end

end