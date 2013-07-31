# TODO: move this to spec_helper
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
