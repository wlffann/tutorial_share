require 'rails_helper'

RSpec.feature "Visitor can register" do

  scenario "as a user" do
    visit new_user_path
    fill_in 'user[first_name]', :with => "Annie"
    fill_in 'user[last_name]', :with => "Wolff"
    fill_in 'user[username]', :with => "wlffann"
    fill_in 'user[email]', :with => "aw@wolff.com"
    fill_in 'user[password]', :with => "password"
    click_on "Create Account"

    expect(page).to have_content("Your account was created!")
    expect(page).to have_content("Welcome, Annie!")
  end

  scenario "only with new email address" do
    User.create(first_name: "Amy", last_name: "Wolff", email: "aw@wolff.com", password: "password")
    visit new_user_path
    fill_in 'user[first_name]', :with => "Annie"
    fill_in 'user[last_name]', :with => "Wolff"
    fill_in 'user[username]', :with => "wlffann"
    fill_in 'user[email]', :with => "aw@wolff.com"
    fill_in 'user[password]', :with => "password"
    click_on "Create Account"

    expect(page).to have_content("Email has already been taken")
  end

  scenario "only with all information" do
    visit new_user_path
    fill_in 'user[last_name]', :with => "Wolff"
    fill_in 'user[username]', :with => "wlffann"
    fill_in 'user[email]', :with => "aw@wolff.com"
    fill_in 'user[password]', :with => "password"
    click_on "Create Account"

    expect(page).to have_content("First name can't be blank")
  end

end