require 'spec_helper'

feature "Stone Management" do

  let!(:user) { create(:user) }
  let!(:stone) { create(:stone) }

  before do
    login user
  end

  scenario "User can create a stone" do
    visit new_stone_path
    fill_in 'Title', with: "New Stone"
    fill_in 'Description', with: "Here's a new stone."
    click_button 'Create Stone'
    page.should have_content "New Stone"
  end

  scenario "User searches for a stone and finds it.", js: true do
    visit root_path
    within 'div.content' do
      # fill_in 'main search', :with => stone.title
      page.execute_script("$('form input').val('#{stone.title}')")
      page.execute_script("$('form').submit()")
    end
    page.should have_content stone.title
  end

  scenario "User Visits Stone Page and sees Stone Title" do
    visit stone_path(stone)
    expect(page).to have_content(stone.title)
  end
end

feature "Creating a stone after searching for it" do

  let(:user) { create(:user) }

  scenario "when user is signed in", js: true do
    login user
    visit root_path
    within 'div.content' do
      # fill_in 'main search', :with => stone.title
      page.execute_script("$('form input').val('Knife Throwing')")
      page.execute_script("$('form').submit()")
    end
    page.should have_content("No Results Found :-(")
      page.should have_link("Knife Throwing")
    end

    scenario "when user is not signed in", js: true do
      visit root_path
      fill_in "query", with: "Knife Throwing"
      page.execute_script("$('#query').submit()")
      click_link "Knife Throwing"
      current_path.should eq(new_user_session_path)
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign in"
      expect(page).to have_content('Create a Stone')
      expect(page).to have_css('form')
    end

    scenario "when user doesn't exist", js: true do
      visit root_path
      fill_in "query", with: "Knife Throwing"
      page.execute_script("$('#query').submit()")
      click_link "Knife Throwing"
      current_path.should eq(new_user_session_path)
      click_link "Sign up"
      fill_in "Name", with: "Jimothy"
      fill_in "Email", with: "jim@bim.net"
      fill_in "pc", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      expect(page).to have_content('Create a Stone')
      expect(page).to have_css('form')
    end

  end

