require 'spec_helper'

  feature 'Signing In' do

    let(:user) { FactoryGirl.create(:user) }

    before(:each) { visit new_user_session_path }

    scenario 'User can log in with their username and pwd' do
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign in"
      current_path.should eq(root_path)
    end

    scenario 'User cannot log in with incorrect username or pwd' do
      fill_in "Email", with: "Your Mom Goes To College"
      fill_in "Password", with: "password"
      click_button "Sign in"
      current_path.should eq(new_user_session_path)
    end
  end

  feature 'Signing Up' do

    let(:user) { FactoryGirl.build(:user) }

    before(:each) { visit new_user_registration_path }

    scenario 'User can register with valid name, email and pwd' do

      fill_in "Email", with: user.email
      fill_in "Name", with: user.name
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button "Sign up"
      current_path.should eq(root_path)
    end

    scenario "Should not let you register without an email" do
      fill_in "Email", with: nil
      fill_in "Name", with: user.name
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      expect(current_path).to eq(user_registration_path)
    end

    scenario "Should not let you register without a name" do
      fill_in "Email", with: user.email
      fill_in "Name", with: nil
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      expect(current_path).to eq(user_registration_path)
    end
    
    scenario "Should not let you register without a password" do
      fill_in "Email", with: user.email
      fill_in "Name", with: user.name
      click_button "Sign up"
      expect(current_path).to eq(user_registration_path)
    end

    scenario "Should not let you register without the same pwd confirmation" do
      fill_in "Email", with: user.email
      fill_in "Name", with: user.name
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "drowssap"
      click_button "Sign up"
      expect(current_path).to eq(user_registration_path)
    end


  end
