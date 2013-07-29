class AddDueDateToSavedResource < ActiveRecord::Migration
  def change
    add_column :saved_resources, :due_date, :datetime
  end
end
