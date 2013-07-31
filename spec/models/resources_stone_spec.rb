require 'spec_helper'
include StonesHelper

describe ResourcesStone do
  let(:resources_stone) { FactoryGirl.create(:resources_stone) }

  it { should have_many :votes }
  it { should belong_to :stone }
  it { should belong_to :resource }

  context "Methods" do
    it "vote tally should return correct value of votes" do
      # TODO: test that it's the sum of all vote values
      expect {
        resources_stone.votes << FactoryGirl.create(:vote)
      }.to change { resources_stone.vote_tally }.by(1)
    end
  end

end
