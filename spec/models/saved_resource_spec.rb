require 'spec_helper'

describe SavedResource do

  context "Validations" do
    it { should belong_to(:stones_user) }
  end

end
