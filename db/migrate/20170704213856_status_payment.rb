class StatusPayment < ActiveRecord::Migration
  def change
    add_column :payments, :ready, :boolean, default: false
    add_column :payments, :canceled, :boolean, default: false
  end
end
