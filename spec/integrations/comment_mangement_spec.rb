require 'spec_helper'

feature "Comments:", js: true do

  let(:user) { create(:user) }
  let(:stone) { create(:stone) }
  let(:discussion) { create(:discussion) }
  let(:comment) { create(:comment) }

  before do
    discussion.comments << comment
    stone.discussions << discussion
    user.stones << stone
    login user

    visit stone_path(stone)
    click_link("Discussion")
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
end
