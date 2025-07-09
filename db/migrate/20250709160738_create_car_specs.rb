class CreateCarSpecs < ActiveRecord::Migration[8.0]
  def change
    create_table :car_specs do |t|
      t.references :car, null: false, foreign_key: true, index: { unique: true } # 1:1 relationship

      t.references :engine_oil_viscosity, foreign_key: true
      t.references :engine_oil_quantity, foreign_key: true
      t.references :engine_oil_filter, foreign_key: true

      t.references :brake_fluid_type, foreign_key: true
      t.references :brake_pads, foreign_key: true
      t.references :brake_rotors, foreign_key: true

      t.references :tire_size, foreign_key: true
      t.references :tire_brand, foreign_key: true

      t.references :transmission_fluid_type, foreign_key: true
      t.references :transmission_fluid_quantity, foreign_key: true

      t.references :coolant_type, foreign_key: true
      t.references :engine_air_filter, foreign_key: true
      t.references :cabin_air_filter, foreign_key: true

      t.references :wiper_blade_sizes, foreign_key: true

      t.references :headlights, foreign_key: true
      t.references :taillights, foreign_key: true
      t.references :turn_signal_lights, foreign_key: true
      t.references :license_plate_light, foreign_key: true

      t.references :battery, foreign_key: true
      t.references :serpentine_belt, foreign_key: true
      t.references :thermostat, foreign_key: true

      t.timestamps
    end
  end
end
