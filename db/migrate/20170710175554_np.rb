class Np < ActiveRecord::Migration
  def change
    add_column :payments, :np, :string
    add_column :payments, :rechazado, :boolean, default: false
  end
end
