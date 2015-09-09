class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.text :room_name
      t.integer :hour_0
      t.integer :hour_1
      t.integer :hour_2
      t.integer :hour_3
      t.integer :hour_4
      t.integer :hour_5
      t.integer :hour_6
      t.integer :hour_7
      t.integer :hour_8
      t.integer :hour_9
      t.integer :hour_10
      t.integer :hour_11
      t.integer :hour_12
      t.integer :hour_13
      t.integer :hour_14
      t.integer :hour_15
      t.integer :hour_16
      t.integer :hour_17
      t.integer :hour_18
      t.integer :hour_19
      t.integer :hour_20
      t.integer :hour_21
      t.integer :hour_22
      t.integer :hour_23

      t.timestamps null: false
    end
  end
end
