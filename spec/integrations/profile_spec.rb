require 'spec_helper'

feature "Viewing a user's profile" do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {User.create(name: "Jane Doe", email: "jane@doe.net", password: 'password')}

  before do
    login user1
  end
  
  scenario "user visits another user's profile." do
    visit user_path(user2)
    page.should have_content(user2.name)
  end


  scenario "user visits their own profile." do
    visit user_path(user1)
    page.should have_content("This is you!")
  end
end
