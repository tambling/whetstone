require 'spec_helper'

feature "Stone Management" do

  let(:user) { FactoryGirl.create(:user) }
  let(:stone) { FactoryGirl.create(:stone) }

  before(:each){
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
  }

  scenario "User can create a stone" do
    visit new_stone_path
    fill_in 'Title', with: "New Stone"
    fill_in 'Description', with: "Here's a new stone."
    click_button 'Create Stone'
    page.should have_content "New Stone"
  end

  scenario "User searches for a stone and finds it.", js: true do
    visit root_path
    fill_in "nav_search", with: stone.title
    page.execute_script("$('#submit').click();")
    page.should have_content stone.title
  end

  scenario "User Visits Stone Page and sees Stone Title" do
    visit stone_path(stone)
    expect(page).to have_content(stone.title)
  end
end

feature "Adding a stone after searching for it" do

  let(:user) {FactoryGirl.create(:user)}

  scenario "when user is signed in", js: true do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
    fill_in "nav_search", with: 'Knife Throwing'
    page.execute_script("$('#submit').click();")
    page.should have_content("Sorry, we weren't able to find anything about that.")
    find_field('Title').value.should eq 'Knife Throwing'
  end

  scenario "when user is not signed in", js: true do
    visit root_path
    fill_in "nav_search", with: "Knife Throwing"
    page.execute_script("$('#submit').click();")
    current_path.should eq(new_user_session_path)
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
    find_field('Title').value.should eq 'Knife Throwing'
  end

  scenario "when user doesn't exist", js: true do
    visit root_path
    fill_in "nav_search", with: "Knife Throwing"
    page.execute_script("$('#submit').click();")
    current_path.should eq(new_user_session_path)
    click_link "Sign up"
    fill_in "Name", with: "Jimothy"
    fill_in "Email", with: "jim@bim.net"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    find_field('Title').value.should eq 'Knife Throwing'
  end

end

