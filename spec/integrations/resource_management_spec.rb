  require 'spec_helper'

  feature "Resources Page Management", js: true do

    let(:user) { FactoryGirl.create(:user) }
    let(:stone) { FactoryGirl.create(:stone) }
    let(:resource) { FactoryGirl.create(:resource) }

    before do
      login user
      stone.resources << resource
      user.goals.destroy_all
      visit stone_path(stone)
    end

    scenario "User Visits Resources Page" do
      click_link("Resources")
      expect(page).to have_content(resource.title)
    end

    scenario "User Visits Resources Page And Can Add a Resource" do
      Capybara.ignore_hidden_elements = true
      click_link("Resources")
      click_link("Add Resource")
      fill_in('Title', :with => 'Poodr')
      fill_in('Description', :with => 'What the FUCK AM I DOING!')
      fill_in('Url', :with => 'http://www.soccernet.com')
      fill_in('Recommended time', :with => 600)

      page.find(:css,'.submit_button input').click
      visit stone_path(stone)
      click_link("Resources")
      expect(page).to have_content("Poodr")
    end

    scenario "User filters by difficulty", js: true do
      stone.resources << FactoryGirl.create(:resource, difficulty: "Expert", title: "An expert resource")
      stone.resources << FactoryGirl.create(:resource, difficulty: "Beginner", title: "An easy resource")
      visit stone_path(stone)
      click_link "Resources"
      click_link "Beginner"
      page.should_not have_content "An expert resource"
      page.should have_content "An easy resource"
      click_link "Expert"
      page.should_not have_content "An easy resource"
      page.should have_content "An expert resource"
    end
  end
