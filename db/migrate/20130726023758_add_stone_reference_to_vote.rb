class AddStoneReferenceToVote < ActiveRecord::Migration
  def change
  	add_column :votes, :stone_id, :integer
  end
end
