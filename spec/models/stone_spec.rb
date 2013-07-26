require 'spec_helper'

describe Stone do

	let(:stone) { FactoryGirl.build(:stone) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should validate_uniqueness_of(:title) } 
		it { should have_and_belong_to_many(:resources) }
	end

end
