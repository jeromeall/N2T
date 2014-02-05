class AddYidToSpots < ActiveRecord::Migration
  def change
  	add_column :spots, :yelp_id, :string
  end
end
