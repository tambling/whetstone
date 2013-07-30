class AddQueueToGoals < ActiveRecord::Migration
  def change
    add_column :stones_users, :queue, :string, default: ""
  end
end
