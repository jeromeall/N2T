class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :spot, index: true

      t.timestamps
    end
  end
end
