require 'spec_helper'

feature "Stone Management" do

  let(:stone_with_resources) { FactoryGirl.create(:stone_with_resources) }
  
  scenario "User can create a stone" do
    visit new_stone_path
    fill_in 'Title', with: "New Stone"
    fill_in 'Description', with: "Here's a new stone."
    click_button 'Create Stone'
    page.should have_content "New Stone"
  end

  scenario "User Visits Stone Page and sees Stone Title" do
      visit stone_path(stone_with_resources)
      expect(page).to have_content(stone_with_resources.title)
  end

  scenario "User Clicks on Beginner Filter and Sees ONLY Beginner Level Items" do
    # visit stone_path(stone_with_resources)
    # p stone_with_resources.resources

    # click_link("Beginner")

    # within(:css, '.resources') do
    #   find(:css, '.Intermediate').should_not be_visible
    # end

  end
end
