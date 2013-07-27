require 'spec_helper'


feature "Adding a goal" do
    let(:stone) {FactoryGirl.create(:stone)}
    let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    #@stone = Stone.create(title: "A stone", description: "here's a stone")
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
    click_button 'Add Goal'
    sleep 2
    user.goals.count.should eq(1)
  end
end
