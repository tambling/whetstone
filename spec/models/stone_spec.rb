require 'spec_helper'

describe Stone do

	let!(:stone) { FactoryGirl.create(:stone) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should validate_uniqueness_of(:title) } 
		it { should belong_to(:user) }
		it { should have_many(:resources) }
	end

end
