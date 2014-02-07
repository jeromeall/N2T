class RemoveDisplayAddressFromSpots < ActiveRecord::Migration
  def change
  	remove_column :spots, :display_address
  end
end
