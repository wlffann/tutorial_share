require 'rails_helper'

RSpec.feature "User logs in" do

  scenario "with valid credentials" do
    user = User.create(first_name: "Annie", last_name: "Wolff", username: "wlff", email: "aw@wolff.com", password: "password")
    visit login_path
    within 'form' do
      fill_in 'email', with: "aw@wolff.com"
      fill_in 'password', with: "password"
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Logged in!")
    expect(page).to have_content("Welcome, #{user.first_name}!")
  end

end