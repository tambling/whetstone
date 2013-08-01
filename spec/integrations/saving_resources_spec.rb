# require 'spec_helper'

#   feature "Saving Resources" , js: true do
#     let(:user) { create(:user) }
#     let(:stone) { create(:stone) }
#     let(:resource) { create(:resource) }

#     scenario "User cannot save resource when not signed in" do
#       visit stone_path(stone)
#       expect(page).to_not have_link("Add To Your Goals")
#     end

#     scenario "User cannot save resources to their queue when not signed in" do
#       stone.resources << resource
#       visit stone_path(stone)
#       debugger
#       first('.save_resource').click

#       expect(page).to have_content("Something")
#     end


#   end

