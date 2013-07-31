require 'spec_helper'

describe SavedResourcesController do 

	let!(:resource_stone) { FactoryGirl.create(:resources_stone, stone_id: 1) }
	let!(:user) { FactoryGirl.create(:user) }
	let!(:goal) { FactoryGirl.create(:stones_user) }
	let!(:stone) { FactoryGirl.create(:stone) }

	describe "POST #create" do 
		
		context "user is signed in" do 
			
			before do
				controller.stub(:user_signed_in?).and_return(true)
				controller.stub(:current_user).and_return(user)
				controller.stub(:create_goal_for).and_return(goal)
				controller.stub(:stone).and_return(stone)
			end
			
			it "should return an error when the resource has already been saved" do 
				post :create, resources_stone_id: 1
				post :create, resources_stone_id: 1
				expect(response.status).to eq 422
			end

			it "should return successful if the resource saves to the db" do 
				post :create, resources_stone_id: 1
				expect(response.status).to eq 201
			end

		end

		context "when the user is not signed in" do 
			before do
				controller.stub(:user_signed_in?).and_return(false)
			end

			it "should redirect to a 'user not signed in' page" do 
				post :create
				expect(ResourcesStone).not_to receive(:find)
				expect(response.status).to eq 401
			end
		
		end

	end

end