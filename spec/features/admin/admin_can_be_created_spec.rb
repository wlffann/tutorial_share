require 'rails_helper'

RSpec.feature "Create new admin user" do

  scenario "only available to another admin" do
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)
    visit new_admin_user_path
    fill_in 'user[first_name]', :with => "Annie"
    fill_in 'user[last_name]', :with => "Wolff"
    fill_in 'user[username]', :with => "wlffann"
    fill_in 'user[email]', :with => "aw@wolff.com"
    fill_in 'user[password]', :with => "password"
    click_on "Create Admin"


    expect(page).to have_content("Now logged in as Annie!")
  end

end