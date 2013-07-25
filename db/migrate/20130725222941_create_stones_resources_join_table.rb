class CreateStonesResourcesJoinTable < ActiveRecord::Migration
  def change
  	create_table :stones_resources do |t|
  		t.references :stones
  		t.references :resources
  	end
  end
end
