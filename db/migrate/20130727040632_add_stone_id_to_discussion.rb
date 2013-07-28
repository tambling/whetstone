class AddStoneIdToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :stone_id, :integer
  end
end
