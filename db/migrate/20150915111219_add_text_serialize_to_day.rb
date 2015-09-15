class AddTextSerializeToDay < ActiveRecord::Migration
  def change
    add_column :days, :full_data, :text
  end
end
