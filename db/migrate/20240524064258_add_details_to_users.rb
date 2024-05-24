class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :first_name, :string 
    add_column :users, :last_name, :string 
    add_column :users, :telephone_number, :string 
  end
end
