require 'spec_helper'

feature "Stone Management" do

  let(:stone_with_resources) { FactoryGirl.create(:stone_with_resources) }

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

  scenario "User searches for a stone and finds it." do
    visit root_path
    fill_in "I want to learn about...", with: stone_with_resources.title
    click_button 'Search'
    page.should have_content stone_with_resources.title
  end

  scenario "User Visits Stone Page and sees Stone Title" do
    visit stone_path(stone_with_resources)
    expect(page).to have_content(stone_with_resources.title)
  end

feature "Adding a stone after searching for it" do
  
  let(:user) {FactoryGirl.create(:user)}

  scenario "when user is signed in", js: true do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
    fill_in "I want to learn about...", with: 'Knife Throwing'
    click_button "Search"
    page.should have_content("Sorry, we weren't able to find anything about that.")
    find_field('Title').value.should eq 'Knife Throwing'
  end

  scenario "when user is not signed in" do
    visit root_path
    fill_in "I want to learn about...", with: "Knife Throwing"
    click_button "Search"
    current_path.should eq(new_user_session_path)
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
    find_field('Title').value.should eq 'Knife Throwing'
  end

  scenario "when user doesn't exist" do
    visit root_path
    fill_in "I want to learn about...", with: "Knife Throwing"
    click_button "Search"
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

