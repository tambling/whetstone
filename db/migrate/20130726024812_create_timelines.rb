class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :stones_user

      t.timestamps
    end
  end
end
