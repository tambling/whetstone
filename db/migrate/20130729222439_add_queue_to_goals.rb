class AddQueueToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :queue, :string, default: ""
  end
end
