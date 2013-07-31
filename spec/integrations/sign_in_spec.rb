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

feature 'Signing Up', js: true do

  let(:user) { FactoryGirl.build(:user) }
  let(:registration_data) {
    {"Email" => user.email, "Name" => user.name, "pc" => "password", "Password confirmation" => "password"}
  }

  before(:each) { 
    visit new_user_registration_path 
  }

  scenario 'User can register with valid name, email and pwd' do
    registration_data.each { |k, v| fill_in k, with: v }
    click_button "Sign up"
    current_path.should eq(root_path)
  end

  scenario "Should not let you register without an email" do
    registration_data['Email'] = nil
    registration_data.each { |k, v| fill_in k, with: v }
    click_button "Sign up"
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario "Should not let you register without a name" do
    registration_data['Name'] = nil
    registration_data.each { |k, v| fill_in k, with: v }
    click_button "Sign up"
    expect(current_path).to eq(new_user_registration_path)
  end
  
  scenario "Should not let you register without a password" do
    registration_data['pc'] = nil
    registration_data.each { |k, v| fill_in k, with: v }
    click_button "Sign up"
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario "Should not let you register without the same pwd confirmation" do
    registration_data['pc'] = "12"
    registration_data.each { |k, v| fill_in k, with: v }
    click_button "Sign up"
    expect(current_path).to eq(new_user_registration_path)
  end


end
