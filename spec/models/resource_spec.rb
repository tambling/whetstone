require 'spec_helper'

describe Resource do

	let(:resource) { FactoryGirl.build(:resource) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should validate_presence_of(:recommended_time) }
		it { should have_and_belong_to_many(:stones) }
		it { should have_many(:votes) }
	end

end
