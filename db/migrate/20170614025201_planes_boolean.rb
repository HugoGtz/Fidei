class PlanesBoolean < ActiveRecord::Migration
  def change
    add_column :users, :p1, :boolean, default: false
    add_column :users, :p2, :boolean, default: false
    add_column :users, :p3, :boolean, default: false
    add_column :users, :p4, :boolean, default: false
    add_column :users, :id_firebase, :string, default: false
  end
end
