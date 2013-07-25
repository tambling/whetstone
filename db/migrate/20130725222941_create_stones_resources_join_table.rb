class CreateStonesResourcesJoinTable < ActiveRecord::Migration
  def change
  	create_table :stones_resources do |t|
  		t.references :stone
  		t.references :resource
  	end
  end
end
