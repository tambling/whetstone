require 'spec_helper'

describe Comment do

  let(:comment) { FactoryGirl.create(:comment) }

  context "Validations" do
    it { should validate_presence_of(:content) }
    it { should belong_to(:commentable) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  context "Methods" do
    it "vote tally should return correct value of votes" do
      expect {
        comment.votes << FactoryGirl.create(:vote)  
      }.to change { comment.vote_tally }.by(1)
    end
  end

end


