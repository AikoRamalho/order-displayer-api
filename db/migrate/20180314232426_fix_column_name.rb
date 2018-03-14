class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :create_by, :created_by
  end
end
