class CreateSavedResources < ActiveRecord::Migration
  def change
    create_table :saved_resources do |t|
      t.references :stones_user
      t.references :resources_stone

      t.timestamps
    end
  end
end
