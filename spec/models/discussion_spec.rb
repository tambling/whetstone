require 'spec_helper'

describe Discussion do

  context "Validations" do

    it { should validate_presence_of(:title) }
    it { should have_many(:comments) }
    it { should belong_to(:stone) }
    it { should belong_to(:user) }    

  end
end
