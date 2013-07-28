require 'spec_helper'
include StonesHelper

describe ResourcesStone do
  let(:stone) { FactoryGirl.create(:alt_stone_with_resources) }
  let(:resource_stone) { FactoryGirl.build(:resource_stone) }
  
  it { should have_many :votes }
  it { should belong_to :stone }
  it { should belong_to :resource }
  
  context "model methods" do
    it "should sum votes" do
      expect(resource_stone.votes).to be_kind_of(Fixnum)
    end
  end

  context "model helpers" do
    it "should have a relationship" do
      resource_stone.save
      expect(get_relationship(resource_stone.resource_id, resource_stone.stone_id)).to be_kind_of(Object)
    end
  end
end
