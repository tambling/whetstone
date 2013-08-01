require 'spec_helper'

describe Stone do

	let(:stone) { FactoryGirl.build(:stone) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_uniqueness_of(:title) } 
		it { should have_many(:resources_stones) }
		it { should have_many(:resources) }
	end

end
