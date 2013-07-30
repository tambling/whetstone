require 'spec_helper'

describe StonesUser do
  let(:stone) {FactoryGirl.create(:stone)}
  let(:user) {FactoryGirl.create(:user)}
  let(:goal) {StonesUser.create(stone_id: stone.id, user_id: user.id, queue: "1")}
  it 'should return saved resources in its queue' do
    SavedResource.stub(:find).with(1).and_return("Hi")
    goal.queued_items.should eq (["Hi"])
  end
end




