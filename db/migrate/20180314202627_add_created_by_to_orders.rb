class AddCreatedByToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :create_by, :string
  end
end
