class AddDifficultyToResources < ActiveRecord::Migration
  def change
    add_column :resources, :difficulty, :string, default: "Medium"
  end
end
