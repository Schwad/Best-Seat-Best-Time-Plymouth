class ChangeBackToFloat < ActiveRecord::Migration
  def change
     change_column :datapoints, :free, :float
  end
end
