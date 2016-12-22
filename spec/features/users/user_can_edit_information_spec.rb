require 'rails_helper'

RSpec.feature "User can edit their information" do

  scenario "through the edit path" do
    user = User.create(first_name: "Annie", last_name: "Wolff", username: "wlff", email: "aw@wolff.com", password: "password")
    visit edit_user_path(user)
    fill_in 'user[username]', with: "wlffann"
    fill_in 'user[password]', with: "password"
    click_on "Update Account"

    expect(page).to have_content("wlffann")
  end

  scenario "but it will not save if invalid" do
    user = User.create(first_name: "Annie", last_name: "Wolff", username: "wlff", email: "aw@wolff.com", password: "password")
    visit edit_user_path(user)
    fill_in 'user[first_name]', with: ""
    fill_in 'user[password]', with: "password"
    click_on "Update Account"

    expect(page).to have_content("First name can't be blank")
  end

end