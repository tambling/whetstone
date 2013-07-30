require 'spec_helper'

feature "Discussions Page Management", js: true do

  let(:user) { FactoryGirl.create(:user) }
  let(:stone) { FactoryGirl.create(:stone) }
  let(:discussion) { FactoryGirl.create(:discussion, user: user, stone: stone) }


  # scenario "User can Sign in" do
  #   visit new_user_session_path
  #   fill_in('Email', :with => discussion.user.email)
  #   fill_in('Password', :with => 'password')
  #   page.find(:css,'input[name=commit]').click
  #   expect(page).to_not have_content("Sign in")
  #   expect(page).to have_content("What do you want to learn about?")
  # end

  before(:each) do
    visit new_user_session_path
    fill_in('Email', :with => discussion.user.email)
    fill_in('Password', :with => 'password')
    page.find(:css,'input[name=commit]').click

    visit stone_path(discussion.stone)
  end

  scenario "User Visits Discussions Page And Sees Title And Content" do
    click_link("Discussions")
    expect(page).to have_content(discussion.title)
    expect(page).to have_content(discussion.content)
  end

  scenario "User Visits Discussions Page And Can Add a Discussion" do
    click_link("Discussions")

    fill_in('Title', :with => 'How many woods does a woodchuck chuck?')
    fill_in('Content', :with => 'When in rome!')

    page.find(:css,'.submit_button input').click

    expect(page).to have_content("How many woods does a woodchuck chuck?")
  end

  scenario "User Can Visit a Specific Discussion" do
    click_link("Discussions")

    click_link(discussion.title)

    expect(page).to have_content(discussion.title)
    expect(page).to have_content(discussion.content)
  end



end
