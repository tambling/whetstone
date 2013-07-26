class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.references :user
  		t.references :resource 
  		t.integer :value
  	end
  end
end
