class AddNameToRoomsIsBetter < ActiveRecord::Migration
  def change
     add_column :datapoints, :room_name, :text
  end
end
