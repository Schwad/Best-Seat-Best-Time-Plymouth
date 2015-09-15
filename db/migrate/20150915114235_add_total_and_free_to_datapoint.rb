class AddTotalAndFreeToDatapoint < ActiveRecord::Migration
  def change
    add_column :datapoints, :total_rooms, :integer
    add_column :datapoints, :total_available, :integer
  end
end
