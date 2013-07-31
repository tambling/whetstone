require 'spec_helper'

describe Discussion do

  let(:discussion) { FactoryGirl.create(:discussion) }

  context "Validations" do
    it { should validate_presence_of(:title) }
    it { should have_many(:comments) }
    it { should belong_to(:stone) }
    it { should belong_to(:user) }    
    it { should have_many(:votes) }
  end

  context "Methods" do
    it "vote tally should return correct value of votes" do
      expect {
        discussion.votes << FactoryGirl.create(:vote)  
      }.to change { discussion.vote_tally }.by(1)
    end
  end
end
