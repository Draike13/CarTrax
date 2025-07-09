class CreatePartsTables < ActiveRecord::Migration[8.0]
  # This migration creates tables for various car parts and their attributes.
  # Each table will store data related to specific car parts
  def change
    create_table :engine_oil_viscosities do |t|
      t.string :data
    end

    create_table :engine_oil_quantities do |t|
      t.string :data
    end

    create_table :engine_oil_filters do |t|
      t.string :data
    end

    create_table :brake_fluid_types do |t|
      t.string :data
    end

    create_table :brake_pads do |t|
      t.string :data
    end

    create_table :brake_rotors do |t|
      t.string :data
    end

    create_table :tire_sizes do |t|
      t.string :data
    end

    create_table :tire_brands do |t|
      t.string :data
    end

    create_table :transmission_fluid_types do |t|
      t.string :data
    end

    create_table :transmission_fluid_quantities do |t|
      t.string :data
    end

    create_table :coolant_types do |t|
      t.string :data
    end

    create_table :engine_air_filters do |t|
      t.string :data
    end

    create_table :cabin_air_filters do |t|
      t.string :data
    end

    create_table :wiper_blade_sizes do |t|
      t.string :data
    end

    create_table :headlights do |t|
      t.string :data
    end

    create_table :taillights do |t|
      t.string :data
    end

    create_table :turn_signal_lights do |t|
      t.string :data
    end

    create_table :license_plate_lights do |t|
      t.string :data
    end

    create_table :batteries do |t|
      t.string :data
    end

    create_table :shocks_struts do |t|
      t.string :data
    end

    create_table :spark_plugs do |t|
      t.string :data
    end

    create_table :coil_packs do |t|
      t.string :data
    end

    create_table :serpentine_belts do |t|
      t.string :data
    end

    create_table :timing_chains do |t|
      t.string :data
    end

    create_table :timing_sprockets do |t|
      t.string :data
    end

    create_table :timing_tensioners do |t|
      t.string :data
    end

    create_table :crankshaft_sprockets do |t|
      t.string :data
    end

    create_table :vvt_solenoids do |t|
      t.string :data
    end

    create_table :camshaft_position_sensors do |t|
      t.string :data
    end

    create_table :crankshaft_position_sensors do |t|
      t.string :data
    end

    create_table :maf_map_sensors do |t|
      t.string :data
    end

    create_table :thermostats do |t|
      t.string :data
    end

    create_table :throttle_position_sensors do |t|
      t.string :data
    end
  end
end
