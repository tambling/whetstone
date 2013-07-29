require 'spec_helper'

describe Vote do

	let(:vote) { FactoryGirl.build(:vote) }

	context "Validations" do
		it { should validate_presence_of(:value) }
		it { should belong_to(:user) }
		it { should belong_to(:voteable) }
	end

end
