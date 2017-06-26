class CreateP1s < ActiveRecord::Migration
  def change
    create_table :p1s do |t|
      t.integer "id_user", unique: true
      t.integer "posicion"
      t.boolean "success", default: false
      t.timestamps null: false
    end
  end
end
