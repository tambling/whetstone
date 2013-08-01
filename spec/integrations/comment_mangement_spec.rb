require 'spec_helper'

feature "Comments:", js: true do

  let!(:user) { create(:user) }
  let!(:stone) { create(:stone) }
  let!(:discussion) { create(:discussion) }

  before(:each) do
    login user
    user.stones << stone
    stone.discussions << create(:discussion, user_id: 1)
    stone.discussions.first.comments << create(:comment, user_id: 1)
    visit stone_path(stone)
    page.find("#discussion_link").click
  end

  scenario "User Visits Discussions Page And Sees Comment Title And Content", js: true do
    expect(page).to have_content(stone.discussions.first.comments.first.content)
  end

  scenario "User Can Add A Comment", js: true do
    click_link(stone.discussions.first.title)
    fill_in('comment_content', :with => 'I am Commenting')
    page.find(:css,'.submit_button input').click
    expect(page).to have_content("I am Commenting")
  end
end
