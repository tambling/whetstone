class CreateStonesUsersJoinTable < ActiveRecord::Migration
  def change
  	create_table :stones_users do |t|
  		t.references :stone
  		t.references :user
  	end
  end
end
