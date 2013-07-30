require 'spec_helper'

feature "Comments Page Management", js: true do

  let(:user) { FactoryGirl.create(:user) }
  let(:stone) { FactoryGirl.create(:stone) }
  let(:discussion) { FactoryGirl.create(:discussion, user: user, stone: stone) }
  let(:comment) { FactoryGirl.create(:comment, commentable: discussion) }

  before(:each) do
    visit new_user_session_path
    fill_in('Email', :with => discussion.user.email)
    fill_in('Password', :with => 'password')
    page.find(:css,'input[name=commit]').click
    visit stone_path(discussion.stone)
    click_link("Discussions")
    click_link(discussion.title)
  end

  scenario "User Visits Discussions Page And Sees Comment Title And Content" do
    expect(page).to have_content(comment.content)
  end

  scenario "User Can Add A Comment" do

    fill_in('comment_content', :with => 'I am Commenting')
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
