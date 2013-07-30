require 'spec_helper'

describe SavedResource do
  
  context "Validations" do
    it { should have_many(:stones_users) }  
  end

end
