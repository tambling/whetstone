class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :goal

      t.timestamps
    end
  end
end
