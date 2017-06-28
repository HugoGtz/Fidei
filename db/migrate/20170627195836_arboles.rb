class Arboles < ActiveRecord::Migration
  def change
    
    create_table :arbol1s do |t|
      t.integer :user_id, limit: 3 , default: 0
      t.integer :posicion, auto_increment: true
    end
    
    create_table :arbol2s do |t|
      t.integer :user_id, limit: 3, default: 0
      t.integer :posicion, auto_increment: true 
    end
    
    create_table :arbol3s do |t|
      t.integer :user_id, limit: 3, default: 0
      t.integer :posicion, auto_increment: true
    end
    
    create_table :arbol4s do |t|
      t.integer :user_id, limit: 3, default: 0
      t.integer :posicion, auto_increment: true
    end
    
  end
end
