require 'spec_helper'

describe Vote do

	let!(:vote) { FactoryGirl.create(:vote) }

	context "Validations" do
		it { should validate_presence_of(:value) }
		it { should belong_to(:user) }
		it { should belong_to(:resource) }
	end

end
