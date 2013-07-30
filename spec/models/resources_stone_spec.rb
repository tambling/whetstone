require 'spec_helper'
include StonesHelper

describe ResourcesStone do
  let(:stone) { FactoryGirl.create(:alt_stone_with_resources) }
  let(:resource_stone) { FactoryGirl.create(:resource_stone) }

  it { should have_many :votes }
  it { should belong_to :stone }
  it { should belong_to :resource }
  
  context "model methods" do
    it "should sum votes" do
      resource_stone.votes.create(value: 1, user_id: 1)
      resource_stone.votes.create(value: -1, user_id: 2)
      resource_stone.votes.create(value: -1, user_id: 3)
      expect(resource_stone.vote_tally).to eq(-1)
    end
  end

end
