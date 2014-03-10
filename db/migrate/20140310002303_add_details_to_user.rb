class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state_code, :integer
    add_column :users, :zip, :integer
    add_column :users, :neighborhood, :string
    add_column :users, :about, :text
  end
end
