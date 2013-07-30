require 'spec_helper'
describe Goal do
  context "Queues" do
    let (:goal) {Goal.create(queue:"1")}
    let (:stonesresource) {StonesResource.create}
    it "should add resources when they're in the queue." do
      stonesresource.saved
      goal.queued_items.should eq(["Hi."])
    end
  end
end


