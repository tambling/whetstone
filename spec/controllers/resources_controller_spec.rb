require 'spec_helper'

describe ResourcesController do
  describe "filter" do
    let!(:stone){FactoryGirl.create(:stone)}
    let!(:resource){FactoryGirl.create(:resource)}
    it 'should return a string' do
      stone.resources << resource
      get :filter, stone_id: stone.id, filter: resource.difficulty
      response.should render_template :resources_stone
    end
  end
end
