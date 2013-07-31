require 'spec_helper'

describe StonesUsersController do 

	let!(:user) { FactoryGirl.create(:user) }
	let!(:stone) { FactoryGirl.create(:stone, title: "learn jazz") }
	let!(:resource_stone) { FactoryGirl.create(:resources_stone, stone_id: 1) }
	let!(:goal) { FactoryGirl.create(:stones_user, stone_id: stone.id, user_id: user.id) }

	before do
		controller.stub(:user_signed_in?).and_return(true)
		controller.stub(:current_user).and_return(goal.user)
		controller.stub(:create_goal_for).and_return(goal)
	end

	describe "#new" do 
		it "should return the stone corresponding to the id given" do 
			get :new, stone_id: 1
			expect(response.status).to eq 200
		end
	end

	describe "#update_queue" do 
		it "should properly update the queue" do
			post :update_queue, stone_id: stone.id, queue: [1,2]
		end
	end

end