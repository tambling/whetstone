class AddCreatorIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :creator_id, :integer
  end
end
