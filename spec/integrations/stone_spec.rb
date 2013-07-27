require 'spec_helper'

feature "Stone Management" do

  let(:stone_with_resources) { FactoryGirl.create(:stone_with_resources) }

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

      expect {
        click_button("Add Resource")
      }.to change(Resource, :count).by(1)

      expect(page).to have_content('Poodr')
  end

  scenario "User Visits Stone Page and can see resources" do
      visit stone_path(stone_with_resources)

      expect(page).to have_content(stone_with_resources.resources.first.title)
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
