class AddVinToCars < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :vin, :string, null: false, default: ""
    add_index :cars, :vin, unique: true
  end
end
