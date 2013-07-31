include Warden::Test::Helpers

module FeatureHelpers
  # TODO: remove this method and use login_as straight up
  def login(user)
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    user
  end
end
