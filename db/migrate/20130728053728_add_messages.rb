class AddMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.references :from
      t.references :to
      t.timestamps
    end
  end
end
