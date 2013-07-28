class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
