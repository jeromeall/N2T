class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state_code, :string
    add_column :users, :zip, :integer
    add_column :users, :neighborhood, :string
    add_column :users, :phone, :integer
    add_column :users, :about, :text
  end
end
