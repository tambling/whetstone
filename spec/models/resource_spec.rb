require 'spec_helper'

describe Resource do

	let(:resource) { FactoryGirl.build(:resource) }

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:description) }
		it { should have_many(:stones) }
		it { should have_many(:resources_stones) }
	end

  context "Methods" do
    it "should assign Intermediate as the default value of difficulty" do
      resource.difficulty = nil
      resource.save
      expect(resource.difficulty).to eq("Intermediate")
    end

    it "should return an array of difficulty ratings" do
      expect(Resource.difficulty_ratings).to eq(["Beginner", "Intermediate", "Advanced", "Expert"])
    end 
  end

end
