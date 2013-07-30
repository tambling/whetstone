require 'spec_helper'
  feature 'User can sign in' do
    let(:user) {FactoryGirl.create(:user)}
    before(:each) { visit new_user_session_path }

    scenario 'User gets their sign-in correct' do
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign in"
      current_path.should eq(root_path)
    end

    scenario 'User gets email or password wrong' do
      click_button "Sign in"
      current_path.should eq(new_user_session_path)
    end


  end
