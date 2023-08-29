class CreateScreens < ActiveRecord::Migration[7.0]
  def change
    create_table :screens do |t|
      t.string :screen_name
      t.integer :capacity
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
