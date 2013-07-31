require 'spec_helper'
include ApplicationHelper

describe "ApplicationHelper" do
  let(:user) {FactoryGirl.build :user} 

  it "should display nothing for a user with no errors" do
    expect(display_base_errors(user)).to eq("")  
  end

  it "should display proper html for a user with errors" do
    user.errors[:base] << "Invalid User Info"
    html_error = "    <div class=\"alert alert-error alert-block\">\n      <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&#215;</button>\n      <p>Invalid User Info</p>\n    </div>\n"
    expect(display_base_errors(user)).to eq(html_error)
  end

end
