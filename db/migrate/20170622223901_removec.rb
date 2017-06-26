class Removec < ActiveRecord::Migration
  def change
    remove_column :p1s, :id_padre
    remove_column :p1s, :id_hi
    remove_column :p1s, :id_hd
   
    remove_column :p2s, :id_padre
    remove_column :p2s, :id_hi
    remove_column :p2s, :id_hd
    
    remove_column :p3s, :id_padre
    remove_column :p3s, :id_hi
    remove_column :p3s, :id_hd
    
    remove_column :p4s, :id_padre
    remove_column :p4s, :id_hi
    remove_column :p4s, :id_hd
  end
end
