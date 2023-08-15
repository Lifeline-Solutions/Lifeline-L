class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :photo_id, :string
    add_column :users, :phone_number, :integer
    add_column :users, :id_number, :string
  end
end
