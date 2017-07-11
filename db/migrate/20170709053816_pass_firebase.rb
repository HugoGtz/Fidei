class PassFirebase < ActiveRecord::Migration
  def change
    add_column :users, :pass_firebase, :string
  end
end
