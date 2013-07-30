require 'spec_helper'

describe SavedResource do
  
  context "Validations" do
    it { should belong_to(:stones_user) }
    it { should belong_to(:resources_stone) }  
  end

end
