class CreateStones < ActiveRecord::Migration
  def change
  	create_table :stones do |t|
  		t.string :title
  		t.text :description
  	end
  end
end
