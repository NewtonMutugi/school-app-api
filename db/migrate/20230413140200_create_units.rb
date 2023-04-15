class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :venue
      t.string :day_of_week
      t.integer :duration
      t.string :facilitator

      t.timestamps
    end
  end
end
