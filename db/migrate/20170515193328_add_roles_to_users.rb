class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :supervisor_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
    ## We use this column to see if the user already do the form of firebase
    add_column :users, :firebase_form, :boolean, default: false
  end
end
