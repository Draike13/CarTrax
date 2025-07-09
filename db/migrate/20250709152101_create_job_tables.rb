class CreateJobTables < ActiveRecord::Migration[8.0]
  def change
    # OIL CHANGE
    create_table :oil_changes do |t|
      t.references :oil_viscosity, foreign_key: { to_table: :engine_oil_viscosities }
      t.references :oil_filter, foreign_key: { to_table: :engine_oil_filters }
      t.references :oil_quantity, foreign_key: { to_table: :engine_oil_quantities }
      t.references :service_record, foreign_key: true
    end

    # BRAKE CHANGE
    create_table :brake_changes do |t|
      t.references :brake_fluid_type, foreign_key: true
      t.references :brake_pads, foreign_key: true
      t.references :brake_rotors, foreign_key: true
      t.boolean :flush_fluid
      t.boolean :repair_lines
      t.boolean :replace_rotors
      t.boolean :replace_calipers
      t.references :service_record, foreign_key: true
    end

    # TIRE SERVICE
    create_table :tire_services do |t|
      t.references :tire_size, foreign_key: true
      t.references :tire_brand, foreign_key: true
      t.boolean :tires_rotated
      t.boolean :front_tires_replaced
      t.boolean :rear_tires_replaced
      t.boolean :tire_pressure_sensors_replaced
      t.references :service_record, foreign_key: true
    end

    # TRANSMISSION SERVICE
    create_table :transmission_services do |t|
      t.references :transmission_fluid_type, foreign_key: true
      t.references :transmission_fluid_quantity, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # COOLANT SERVICE
    create_table :coolant_services do |t|
      t.references :coolant_type, foreign_key: true
      t.boolean :coolant_replaced
      t.references :service_record, foreign_key: true
    end

    # AIR FILTERS
    create_table :engine_air_filter_services do |t|
      t.references :engine_air_filter, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    create_table :cabin_air_filter_services do |t|
      t.references :cabin_air_filter, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # WIPERS
    create_table :wiper_blade_services do |t|
      t.references :wiper_blade_sizes, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # LIGHTS
    create_table :light_services do |t|
      t.references :headlight, foreign_key: { to_table: :headlights }
      t.references :taillight, foreign_key: { to_table: :taillights }
      t.references :turn_signal_light, foreign_key: { to_table: :turn_signal_lights }
      t.references :license_plate_light, foreign_key: true
      t.boolean :replaced_all_headlights
      t.boolean :replaced_all_taillights
      t.boolean :replaced_all_turn_signals
      t.boolean :other_light_changed
      t.text :other_light_notes
      t.references :service_record, foreign_key: true
    end

    # BATTERY
    create_table :battery_services do |t|
      t.references :battery, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # REBUILDABLE PARTS
    create_table :alternator_services do |t|
      t.boolean :rebuilt
      t.references :service_record, foreign_key: true
    end

    create_table :starter_services do |t|
      t.boolean :rebuilt
      t.references :service_record, foreign_key: true
    end

    create_table :fuel_pump_services do |t|
      t.references :service_record, foreign_key: true
    end

    # SUSPENSION
    create_table :suspension_services do |t|
      t.references :shocks_struts, foreign_key: true
      t.boolean :front_shocks
      t.boolean :front_struts
      t.boolean :rear_shocks
      t.boolean :rear_struts
      t.boolean :additional_suspension_parts
      t.text :additional_notes
      t.references :service_record, foreign_key: true
    end

    # PLUGS & COILS
    create_table :plugs_coils_services do |t|
      t.references :spark_plugs, foreign_key: true
      t.boolean :replaced_all_spark_plugs
      t.text :spark_plug_notes
      t.references :coil_packs, foreign_key: true
      t.boolean :replaced_all_coil_packs
      t.text :coil_pack_notes
      t.references :service_record, foreign_key: true
    end

    # BELT
    create_table :belt_services do |t|
      t.references :serpentine_belt, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # TIMING
    create_table :timing_services do |t|
      t.references :timing_chain, foreign_key: true
      t.boolean :timing_chain_replaced
      t.boolean :timing_chain_replaced_all
      t.text :timing_chain_notes

      t.references :timing_sprockets, foreign_key: true
      t.boolean :intake_sprocket_replaced
      t.text :intake_sprocket_notes
      t.boolean :exhaust_sprocket_replaced
      t.text :exhaust_sprocket_notes

      t.references :timing_tensioners, foreign_key: true
      t.boolean :tensioners_replaced
      t.boolean :tensioners_replaced_all
      t.text :tensioner_notes

      t.references :crankshaft_sprocket, foreign_key: true
      t.boolean :crankshaft_sprocket_replaced

      t.references :service_record, foreign_key: true
    end

    # EXHAUST
    create_table :exhaust_services do |t|
      t.boolean :catalytic_converter_replaced
      t.boolean :muffler_replaced
      t.boolean :headers_replaced
      t.boolean :resonators_added
      t.boolean :pipes_replaced
      t.boolean :exhaust_tips_replaced
      t.boolean :upstream_o2_replaced
      t.boolean :downstream_o2_replaced
      t.boolean :repair_only
      t.text :notes
      t.references :service_record, foreign_key: true
    end

    # ELECTRICAL TIMING
    create_table :electrical_timing_services do |t|
      t.references :vvt_solenoids, foreign_key: true
      t.boolean :vvt_solenoids_replaced
      t.references :camshaft_position_sensors, foreign_key: true
      t.boolean :camshaft_sensors_replaced
      t.references :crankshaft_position_sensor, foreign_key: true
      t.boolean :crankshaft_sensor_replaced
      t.references :service_record, foreign_key: true
    end

    # MAF/MAP
    create_table :maf_map_sensor_services do |t|
      t.references :maf_map_sensors, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # THERMOSTAT
    create_table :thermostat_services do |t|
      t.references :thermostat, foreign_key: true
      t.references :service_record, foreign_key: true
    end

    # TPS
    create_table :throttle_services do |t|
      t.references :throttle_position_sensor, foreign_key: true
      t.boolean :integrated
      t.references :service_record, foreign_key: true
    end

    # MISC
    create_table :misc_services do |t|
      t.text :part_description
      t.text :notes
      t.references :service_record, foreign_key: true
    end
  end
end
