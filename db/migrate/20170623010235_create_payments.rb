class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :user_id
      t.integer :tipo_paquete
      t.integer :costo
      t.boolean :status
      t.timestamps null: false
    end
  end
end
