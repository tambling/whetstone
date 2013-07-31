require 'spec_helper'

describe StonesController do
  let!(:user){FactoryGirl.create(:user)}
  let!(:stone1){Stone.create(title:"Ruby", description: "Learn Ruby in nine weeks.")}
  let!(:goal) {StonesUser.create(user_id: user.id, stone_id: stone1.id)}

  context "Overview"
    it 'should return the HTML of the partial' do
      get :overview, id: stone1.id
      response.should render_template :overview
    end



end
