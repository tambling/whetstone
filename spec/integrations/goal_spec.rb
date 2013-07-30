require 'spec_helper'


feature "Adding a goal" do
  let(:stone) {FactoryGirl.create(:stone)}
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end

  scenario "user sees a button to add a goal" do
    visit stone_path(stone)
    expect(page).to have_button("Add Goal")
  end

  scenario "user can add a goal to a stone.", js: true do
    visit stone_path(stone)
    StonesUser.destroy_all
    click_button 'add_goal'
    sleep 2
    user.goals.count.should eq(1)
  end
end

feature "Saving resources for a goal" do
  let(:stone) {FactoryGirl.create(:stone)}
  let(:user) {FactoryGirl.create(:user)}
  let(:goal) {StonesUser.create(stone_id: stone.id, user_id: user.id, queue: "1")}
  scenario "queued items returns items in queue" do
    SavedResource.stub(:find).with(1).and_return("Hi")
    goal.queued_items.should eq (["Hi"])
  end
end
