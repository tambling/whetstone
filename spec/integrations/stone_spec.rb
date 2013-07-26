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


  scenario "User Visits Stone Page and sees title" do
      visit stone_path(stone_with_resources)
      expect(page).to have_content(stone_with_resources.title)
  end

  scenario "User Visits Stone Page and can add a resource" do
      visit stone_path(stone_with_resources)
      fill_in('Title', :with => 'Poodr')
      fill_in('Description', :with => 'What the FUCK AM I DOING!')
      fill_in('Url', :with => 'http://www.soccernet.com')
      fill_in('Recommended time', :with => '600')
      click_button("Add Resource")
      expect(page).to have_content('Poodr')
  end
end
