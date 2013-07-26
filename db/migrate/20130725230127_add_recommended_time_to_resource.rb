class AddRecommendedTimeToResource < ActiveRecord::Migration
  def change
  	add_column :resources, :recommended_time, :integer
  end
end
