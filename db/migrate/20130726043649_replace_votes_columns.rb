class ReplaceVotesColumns < ActiveRecord::Migration
  def change
  	remove_column :votes, :resource_id, :stone_id
  	add_column :votes, :resources_stone_id, :integer
  end
end
