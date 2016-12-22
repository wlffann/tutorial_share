require 'rails_helper'

RSpec.feature "User can logout" do

  scenario "when already logged in" do
    user = User.create(first_name: "Annie", last_name: "Wolff", username: "wlff", email: "aw@wolff.com", password: "password")
    visit login_path
    within 'form' do
      fill_in 'email', with: "aw@wolff.com"
      fill_in 'password', with: "password"
      click_on "Login"
    end
    click_on "Logout"

    expect(page).to have_content("Logged out!")
  end

end