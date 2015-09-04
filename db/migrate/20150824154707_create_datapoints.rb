class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.integer :room_id
      t.integer :free

      t.timestamps null: false
    end
  end
end
