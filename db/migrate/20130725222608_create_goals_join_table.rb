class CreateGoalsJoinTable < ActiveRecord::Migration
  def change
  	create_table :goals do |t|
  		t.references :stone
  		t.references :user
  	end
  end
end
