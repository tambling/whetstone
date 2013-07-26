class CreateStonesResourcesJoinTable < ActiveRecord::Migration
  def change
  	create_table :resources_stones do |t|
  		t.references :stone
  		t.references :resource
  	end
  end
end
