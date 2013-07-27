require 'spec_helper'

feature "Viewing a user's profile" do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}
  before(:each) do
    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: "password"
    click_button "Sign in"
  end
  scenario "user visits another user's profile." do
    visit user_path(user2)
    page.should have_content(user2.name)
  end


  scenario "user visits their own profile." do
    visit user_path(user1)
    page.should have_content("This is you!")
  end
end
