require 'spec_helper'

describe StonesUser do

  let(:goal) { FactoryGirl.create(:stones_user) }
  let(:saved_resource) { FactoryGirl.create(:saved_resource, stones_user: :goal) }

  context "Validations" do
    it { should belong_to(:stone) }
    it { should belong_to(:user) }
  end

  it 'should return saved resources in its queue' do
    expect(goal.queued_items).to eq([saved_resource])
  end

end




