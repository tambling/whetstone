require 'spec_helper'

feature "Comments Page Management", js: true do

  let(:discussion_with_comments) { FactoryGirl.create(:discussion_with_comments) }

  before(:each) do
    visit new_user_session_path
    fill_in('Email', :with => discussion_with_comments.user.email)
    fill_in('Password', :with => 'password')
    page.find(:css,'input[name=commit]').click
discussion_with_comments
    visit stone_path(discussion_with_comments.stone)
    click_link("Discussions")
    click_link(discussion_with_comments.title)
  end

  scenario "User Visits Discussions Page And Sees Comment Title And Content" do
    expect(page).to have_content(discussion_with_comments.comments.first.content)
  end  

  scenario "User Visits Discussions Page And Can Add a Discussion" do

    fill_in('Content', :with => 'I am Commenting')

    page.find(:css,'.submit_button input').click

    expect(page).to have_content("I am Commenting")
  end

  # scenario "User Can Visit a Specific Discussion" do
  #   click_link("Discussions")

  #   click_link(discussion.title)

  #   expect(page).to have_content(discussion.title)
  #   expect(page).to have_content(discussion.content)
  # end



end
