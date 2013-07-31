require 'spec_helper'

describe User do
	
	let(:message) { FactoryGirl.create(:message) }
	let(:user1) { message.from }
	let(:user2) { message.to }
	
	let(:goal) { FactoryGirl.create(:stones_user) }
	let(:resources_stone) { FactoryGirl.create(:resources_stone) }
	let(:saved_resource) { FactoryGirl.create(:saved_resource, stones_user: goal, resources_stone: resources_stone) }

	context "Validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }
		it { should have_many(:stones) }
	end

	context "Methods" do

		it "should retrieve messages made with another user" do
			expect(user1.messages_with(user2).size).to eq(1)
		end

		it "should show messages sent and messages recieved" do
			expect(user1.messages.size).to eq(1)
			expect(user2.messages.size).to eq(1)
		end

		it "should retrieve the users that this user has interacted with" do
			expect(user1.message_partners.size).to eq(1)
			expect(user2.message_partners.size).to eq(1)
		end

		it "should get the next resource to be completed" do 
			expect(user1.next_queued_resource).to eq(saved_resource)
		end
	end
end
