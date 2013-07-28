class RemoveReourcesStoneIdFromVotes < ActiveRecord::Migration
  def change
  	remove_column :votes, :resources_stone_id
  end
end
