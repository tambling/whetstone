  require 'spec_helper'

  feature "Resources Page Management", js: true do

    let(:stone_with_resources) { FactoryGirl.create(:stone_with_resources) }

    before(:each) do
      visit stone_path(stone_with_resources)
    end

    # scenario "User Visits Resources Page" do
    #   click_link("Resources")
    #   expect(page).to have_content(stone_with_resources.resources.first.title)
    # end  

    scenario "User Visits Resources Page And Can Add a Resource" do
      click_link("Resources")

      fill_in('Title', :with => 'Poodr')
      fill_in('Description', :with => 'What the FUCK AM I DOING!')
      fill_in('Url', :with => 'http://www.soccernet.com')
      fill_in('Recommended time', :with => 600)

      page.find(:css,'.submit_button input').click

      expect(page).to have_content("Poodr")
    end

  end
