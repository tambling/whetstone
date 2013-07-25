class CreateStonesUsersJoinTable < ActiveRecord::Migration
  def change
  	create_table :stones_users do |t|
  		t.references :stones
  		t.references :users 
  	end
  end
end
