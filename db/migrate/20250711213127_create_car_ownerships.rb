class CreateCarOwnerships < ActiveRecord::Migration[8.0]
  def change
    create_table :car_ownerships do |t|
      t.references :car, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
