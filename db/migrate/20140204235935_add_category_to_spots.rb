class AddCategoryToSpots < ActiveRecord::Migration
  def change
  	add_column :spots, :category, :string
  end
end
