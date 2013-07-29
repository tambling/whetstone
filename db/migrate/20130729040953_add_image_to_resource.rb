class AddImageToResource < ActiveRecord::Migration
  def change
    add_column :resources, :photo, :text
  end
end
