class ChangesColumnTypeToString < ActiveRecord::Migration
  def change
     change_column :datapoints, :free, :decimal
  end
end
