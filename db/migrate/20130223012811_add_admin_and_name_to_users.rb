class AddAdminAndNameToUsers < ActiveRecord::Migration
	def change
    	add_column :users, :admin, :boolean, null: false, default: false
  		add_column :users, :name, :string, null: false, unique: true

  		add_index :users, :name
  	end
end
