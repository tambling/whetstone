require 'spec_helper'

describe Resource do

	let!(:resource) { FactoryGirl.build(:resource) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:content) }
		it { should validate_presence_of(:recommended_time) }
		it { should belong_to(:stone) }
		it { should have_many(:votes) }
	end

end
