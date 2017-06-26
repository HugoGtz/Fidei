class Posicion < ActiveRecord::Migration
  def change
    add_column :p1s, :posicion, :integer, default: "null"
    add_column :p2s, :posicion, :integer, default: "null"
    add_column :p3s, :posicion, :integer, default: "null"
    add_column :p4s, :posicion, :integer, default: "null"
  end
end
