require 'spec_helper'

describe Resource do

	let(:resource) { FactoryGirl.create(:resource) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should have_many(:stones) }
		it { should have_many(:resources_stones) }
	end

end
