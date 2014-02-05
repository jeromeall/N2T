class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.text :rating_img_url
      t.text :snippet_text
      t.text :image_url
      t.string :display_phone
      t.text :address
      t.text :cross_streets
      t.string :city
      t.string :neighborhoods
      t.integer :postal_code
      t.string :state_code

      t.timestamps
    end
  end
end
