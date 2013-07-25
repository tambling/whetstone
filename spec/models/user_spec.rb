require 'spec_helper'

describe User do

	let!(:user) { FactoryGirl.create(:user) }

	context "Validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) } 
		it { should validate_presence_of(:password) } 
	end

end
