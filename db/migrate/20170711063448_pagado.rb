class Pagado < ActiveRecord::Migration
  def change
	add_column :payments, :pagado, :boolean, default: false
  end
end
