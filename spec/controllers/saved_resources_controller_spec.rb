require 'spec_helper'

describe SavedResourcesController do

	let!(:resources_stone) { FactoryGirl.create(:resources_stone, stone_id: 1) }
	let!(:user) { FactoryGirl.create(:user) }
	let!(:test_goal) { FactoryGirl.create(:stones_user) }
	let!(:stone) { FactoryGirl.create(:stone, title: "i has unique dilly-dallying title") }

	describe "POST #create" do

		before do
			controller.stub(:authenticate_user!).and_return(true)
			controller.stub(:current_user).and_return(user)
			controller.stub(:create_goal_for).and_return(test_goal)
			controller.stub(:stone).and_return(stone)
		end

		it "should return an error when the resource has already been saved" do
			post :create, resources_stone_id: 1
			post :create, resources_stone_id: 1
			expect(response.status).to eq 422
		end

		it "should return successful if the resource saves to the db" do
			post :create, resources_stone_id: 1
			assigns(:goal).should_not be_nil
			expect(response.status).to eq 201
		end

	end

end
