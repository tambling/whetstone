class AddPolymorphicAssociationToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :voteable_id, :integer
  	add_column :votes, :voteable_type, :string
  end
end
