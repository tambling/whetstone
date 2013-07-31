require 'spec_helper'

describe VotesController do 

	let!(:resource_stone) { FactoryGirl.create(:resources_stone, stone_id: 1) }
	let!(:user) { FactoryGirl.create(:user) }

	describe "POST #create" do 

		before do
			controller.stub(:current_user).and_return(user)
		end

		it "should return with a status 403 if the vote already exists" do 
			post :create, resources_stone_id: 1, value: 1
			post :create, resources_stone_id: 1, value: 1
			expect(response.status).to eq 403
		end

		it "should return with a status 200 if the vote creation is successful" do 
			post :create, resources_stone_id: 1, value: 1
			expect(response.status).to eq 200
		end
	
	end

	describe "find_voteable" do 

		it "should return the instance of the object being voted on"

	end

end