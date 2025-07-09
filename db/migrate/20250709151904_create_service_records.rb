class CreateServiceRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :service_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.date :service_date
      t.integer :mileage
      t.text :notes

      t.timestamps
    end
  end
end
