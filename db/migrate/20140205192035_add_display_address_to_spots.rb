class AddDisplayAddressToSpots < ActiveRecord::Migration
  def change
  	add_column :spots, :display_address, :text
  end
end
