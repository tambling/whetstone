require 'spec_helper'

feature "Discussions Page Management", js: true do

  let(:user) { create(:user) }
  let(:stone) { create(:stone) }
  let(:discussion) { create(:discussion) }

  before do
    login user
    user.stones << stone
    stone.discussions << discussion
  end

  before(:each) do
    visit stone_path(stone)
    click_link("Discussions")
  end

  scenario "User Visits Discussions Page And Sees Title And Content" do
    expect(page).to have_link(stone.title)
    expect(page).to have_content(discussion.content)
  end

  scenario "User Visits Discussions Page And Can Add a Discussion" do
    fill_in('Title', :with => 'How many woods does a woodchuck chuck?')
    fill_in('Content', :with => 'When in rome!')
    page.find(:css,'.submit_button input').click
    expect(page).to have_content("How many woods does a woodchuck chuck?")
  end

  scenario "User Can Visit a Specific Discussion" do
    click_link(discussion.title)
    expect(page).to have_content(discussion.title)
    expect(page).to have_content(discussion.content)
  end
end
