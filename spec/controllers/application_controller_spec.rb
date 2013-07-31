require 'spec_helper'
describe UsersController do
  describe "authorization" do
    let(:user){FactoryGirl.create(:user)}
    it 'should redirect to the home after CanCan:AccessDenied' do
      controller.stub(:show).and_raise(CanCan::AccessDenied)
      get :show, id: 1
      current_path.should_notg eq(user_path(user))

    end
  end
end
