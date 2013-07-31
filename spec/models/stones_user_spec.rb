require 'spec_helper'

describe StonesUser do

  let(:goal) { FactoryGirl.create(:stones_user, queue: "1, 2") }
  let(:saved_resource) { FactoryGirl.create(:saved_resource, stones_user: :goal) }

  context "Validations" do
    it { should belong_to(:stone) }
    it { should belong_to(:user) }
    it { should have_many(:saved_resources) }
    it { should have_many(:resources_stones) }
  end

  it 'should return saved resources in its queue' do
    # Checks that the numbers in the queue get the right elements.
    SavedResource.stub(:find).with(1).and_return("This.")
    SavedResource.stub(:find).with(2).and_return("That.")
    goal.queued_items.should eq ["This.", "That."]
  end

end




