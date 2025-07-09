class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.text :make
      t.text :model
      t.integer :year
      t.text :trim
      t.text :color
      t.integer :mileage
      t.text :notes

      t.timestamps
    end
  end
end
