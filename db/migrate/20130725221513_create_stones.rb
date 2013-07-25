class CreateStones < ActiveRecord::Migration
  def change
  	create_table :stones do |t|
  		t.string :title
  		t.text :description
  		t.references :users
  		t.references :resources
  	end
  end
end
