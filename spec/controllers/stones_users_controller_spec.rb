require 'spec_helper'

describe StonesUsersController do 

	let!(:resource_stone) { FactoryGirl.create(:resources_stone, stone_id: 1) }
	let!(:user) { FactoryGirl.create(:user) }
	let!(:goal) { FactoryGirl.create(:stones_user) }
	let!(:stone) { FactoryGirl.create(:stone) }

	before do
		controller.stub(:user_signed_in?).and_return(true)
		controller.stub(:current_user).and_return(user)
		controller.stub(:create_goal_for).and_return(goal)
		controller.stub(:stone).and_return(stone)
	end

	describe "#new" do 
		it "should return the stone corresponding to the id given" do 
			get :new, stone_id: 1
			expect(response.status).to eq 200
		end
	end

	describe "#update_queue" do 

	end

end