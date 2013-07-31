require 'spec_helper'

feature "Sending and receiving message" do
  let(:user1) {FactoryGirl.build(:user)}
  let(:user2) {User.new(name: "Jane Doe", email: "jane@doe.net", password: 'password')}
  before(:each) do
    user1.save
    user2.save
    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: 'password'
    click_button 'Sign in'
  end

  scenario "user looks at current messages" do
    Message.create(from_id: user1.id, to_id: user2.id, body:"Sup")
    visit messages_path
    page.should have_link "Jane Doe"
  end
  scenario "user searches for a user", js: true do
    visit messages_path
    fill_in "user_username", with: "Jane"
    click_button "Search"
    page.should have_link "Jane Doe"
  end

  scenario "user searches for a user who doesn't exist", js: true do
    visit messages_path
    fill_in "user_username", with: "Bim"
    click_button "Search"
    page.should have_content "We don't know anybody by that name!"
  end

  scenario "user can see messages with another user" do
    Message.create(from_id: user1.id, to_id: user2.id, body:"Sup")
    visit message_path(user2)
    page.should have_content "Sup"
  end
  scenario "user can send a message" do
    Message.create(from_id: user2.id, to_id: user1.id, body:"Sup")
    visit message_path(user2)
    fill_in "message_body", with: "NM, HBU?"
    click_button "Send"
    page.should have_content "NM, HBU?"
  end



end


feature "Being redirected if not logged in" do
  scenario "user ties to look at messages without logging in" do
    visit messages_path
    current_path.should eq(new_user_session_path)
  end
end
