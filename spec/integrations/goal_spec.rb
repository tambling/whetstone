require 'spec_helper'

feature "User can add a goal", js: true do

  let!(:stone) { create(:stone) }
  let!(:user) { create(:user) }

  before do
    login user
  end

  scenario "User sees a button to add a goal" do
    visit stone_path(stone)
    expect(page).to have_link("Add To Your Goals")
  end

  scenario "User cannot see add goal button if he already has that goal" do
    user.stones << stone
    visit stone_path(stone)
    expect(page).to_not have_link("Add To Your Goals")
  end

  scenario "user can add a goal to a stone." do
    p user.goals
    visit stone_path(stone)
    click_link 'Add To Your Goals'
    # we need to have ajax wait to create the record. Fix This!!
    sleep 2
    expect(user.stones.count).to eq(1)
  end
end
