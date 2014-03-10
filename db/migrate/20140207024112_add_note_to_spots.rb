class AddNoteToSpots < ActiveRecord::Migration
  def change
  	add_column :spots, :note, :text
  end
end
