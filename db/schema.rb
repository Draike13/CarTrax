# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_09_173726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alternator_services", force: :cascade do |t|
    t.boolean "rebuilt"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_alternator_services_on_service_record_id"
  end

  create_table "batteries", force: :cascade do |t|
    t.string "data"
  end

  create_table "battery_services", force: :cascade do |t|
    t.bigint "battery_id"
    t.bigint "service_record_id"
    t.index ["battery_id"], name: "index_battery_services_on_battery_id"
    t.index ["service_record_id"], name: "index_battery_services_on_service_record_id"
  end

  create_table "belt_services", force: :cascade do |t|
    t.bigint "serpentine_belt_id"
    t.bigint "service_record_id"
    t.index ["serpentine_belt_id"], name: "index_belt_services_on_serpentine_belt_id"
    t.index ["service_record_id"], name: "index_belt_services_on_service_record_id"
  end

  create_table "brake_changes", force: :cascade do |t|
    t.bigint "brake_fluid_type_id"
    t.bigint "brake_pads_id"
    t.bigint "brake_rotors_id"
    t.boolean "flush_fluid"
    t.boolean "repair_lines"
    t.boolean "replace_rotors"
    t.boolean "replace_calipers"
    t.bigint "service_record_id"
    t.index ["brake_fluid_type_id"], name: "index_brake_changes_on_brake_fluid_type_id"
    t.index ["brake_pads_id"], name: "index_brake_changes_on_brake_pads_id"
    t.index ["brake_rotors_id"], name: "index_brake_changes_on_brake_rotors_id"
    t.index ["service_record_id"], name: "index_brake_changes_on_service_record_id"
  end

  create_table "brake_fluid_types", force: :cascade do |t|
    t.string "data"
  end

  create_table "brake_pads", force: :cascade do |t|
    t.string "data"
  end

  create_table "brake_rotors", force: :cascade do |t|
    t.string "data"
  end

  create_table "cabin_air_filter_services", force: :cascade do |t|
    t.bigint "cabin_air_filter_id"
    t.bigint "service_record_id"
    t.index ["cabin_air_filter_id"], name: "index_cabin_air_filter_services_on_cabin_air_filter_id"
    t.index ["service_record_id"], name: "index_cabin_air_filter_services_on_service_record_id"
  end

  create_table "cabin_air_filters", force: :cascade do |t|
    t.string "data"
  end

  create_table "camshaft_position_sensors", force: :cascade do |t|
    t.string "data"
  end

  create_table "car_specs", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "engine_oil_viscosity_id"
    t.bigint "engine_oil_quantity_id"
    t.bigint "engine_oil_filter_id"
    t.bigint "brake_fluid_type_id"
    t.bigint "brake_pads_id"
    t.bigint "brake_rotors_id"
    t.bigint "tire_size_id"
    t.bigint "tire_brand_id"
    t.bigint "transmission_fluid_type_id"
    t.bigint "transmission_fluid_quantity_id"
    t.bigint "coolant_type_id"
    t.bigint "engine_air_filter_id"
    t.bigint "cabin_air_filter_id"
    t.bigint "wiper_blade_sizes_id"
    t.bigint "headlights_id"
    t.bigint "taillights_id"
    t.bigint "turn_signal_lights_id"
    t.bigint "license_plate_light_id"
    t.bigint "battery_id"
    t.bigint "serpentine_belt_id"
    t.bigint "thermostat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_car_specs_on_battery_id"
    t.index ["brake_fluid_type_id"], name: "index_car_specs_on_brake_fluid_type_id"
    t.index ["brake_pads_id"], name: "index_car_specs_on_brake_pads_id"
    t.index ["brake_rotors_id"], name: "index_car_specs_on_brake_rotors_id"
    t.index ["cabin_air_filter_id"], name: "index_car_specs_on_cabin_air_filter_id"
    t.index ["car_id"], name: "index_car_specs_on_car_id", unique: true
    t.index ["coolant_type_id"], name: "index_car_specs_on_coolant_type_id"
    t.index ["engine_air_filter_id"], name: "index_car_specs_on_engine_air_filter_id"
    t.index ["engine_oil_filter_id"], name: "index_car_specs_on_engine_oil_filter_id"
    t.index ["engine_oil_quantity_id"], name: "index_car_specs_on_engine_oil_quantity_id"
    t.index ["engine_oil_viscosity_id"], name: "index_car_specs_on_engine_oil_viscosity_id"
    t.index ["headlights_id"], name: "index_car_specs_on_headlights_id"
    t.index ["license_plate_light_id"], name: "index_car_specs_on_license_plate_light_id"
    t.index ["serpentine_belt_id"], name: "index_car_specs_on_serpentine_belt_id"
    t.index ["taillights_id"], name: "index_car_specs_on_taillights_id"
    t.index ["thermostat_id"], name: "index_car_specs_on_thermostat_id"
    t.index ["tire_brand_id"], name: "index_car_specs_on_tire_brand_id"
    t.index ["tire_size_id"], name: "index_car_specs_on_tire_size_id"
    t.index ["transmission_fluid_quantity_id"], name: "index_car_specs_on_transmission_fluid_quantity_id"
    t.index ["transmission_fluid_type_id"], name: "index_car_specs_on_transmission_fluid_type_id"
    t.index ["turn_signal_lights_id"], name: "index_car_specs_on_turn_signal_lights_id"
    t.index ["wiper_blade_sizes_id"], name: "index_car_specs_on_wiper_blade_sizes_id"
  end

  create_table "cars", force: :cascade do |t|
    t.text "make"
    t.text "model"
    t.integer "year"
    t.text "trim"
    t.text "color"
    t.integer "mileage"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coil_packs", force: :cascade do |t|
    t.string "data"
  end

  create_table "coolant_services", force: :cascade do |t|
    t.bigint "coolant_type_id"
    t.boolean "coolant_replaced"
    t.bigint "service_record_id"
    t.index ["coolant_type_id"], name: "index_coolant_services_on_coolant_type_id"
    t.index ["service_record_id"], name: "index_coolant_services_on_service_record_id"
  end

  create_table "coolant_types", force: :cascade do |t|
    t.string "data"
  end

  create_table "crankshaft_position_sensors", force: :cascade do |t|
    t.string "data"
  end

  create_table "crankshaft_sprockets", force: :cascade do |t|
    t.string "data"
  end

  create_table "electrical_timing_services", force: :cascade do |t|
    t.bigint "vvt_solenoids_id"
    t.boolean "vvt_solenoids_replaced"
    t.bigint "camshaft_position_sensors_id"
    t.boolean "camshaft_sensors_replaced"
    t.bigint "crankshaft_position_sensor_id"
    t.boolean "crankshaft_sensor_replaced"
    t.bigint "service_record_id"
    t.index ["camshaft_position_sensors_id"], name: "idx_on_camshaft_position_sensors_id_133ed472ae"
    t.index ["crankshaft_position_sensor_id"], name: "idx_on_crankshaft_position_sensor_id_67167494be"
    t.index ["service_record_id"], name: "index_electrical_timing_services_on_service_record_id"
    t.index ["vvt_solenoids_id"], name: "index_electrical_timing_services_on_vvt_solenoids_id"
  end

  create_table "engine_air_filter_services", force: :cascade do |t|
    t.bigint "engine_air_filter_id"
    t.bigint "service_record_id"
    t.index ["engine_air_filter_id"], name: "index_engine_air_filter_services_on_engine_air_filter_id"
    t.index ["service_record_id"], name: "index_engine_air_filter_services_on_service_record_id"
  end

  create_table "engine_air_filters", force: :cascade do |t|
    t.string "data"
  end

  create_table "engine_oil_changes", force: :cascade do |t|
    t.bigint "oil_viscosity_id"
    t.bigint "oil_filter_id"
    t.bigint "oil_quantity_id"
    t.bigint "service_record_id"
    t.index ["oil_filter_id"], name: "index_engine_oil_changes_on_oil_filter_id"
    t.index ["oil_quantity_id"], name: "index_engine_oil_changes_on_oil_quantity_id"
    t.index ["oil_viscosity_id"], name: "index_engine_oil_changes_on_oil_viscosity_id"
    t.index ["service_record_id"], name: "index_engine_oil_changes_on_service_record_id"
  end

  create_table "engine_oil_filters", force: :cascade do |t|
    t.string "data"
  end

  create_table "engine_oil_quantities", force: :cascade do |t|
    t.string "data"
  end

  create_table "engine_oil_viscosities", force: :cascade do |t|
    t.string "data"
  end

  create_table "exhaust_services", force: :cascade do |t|
    t.boolean "catalytic_converter_replaced"
    t.boolean "muffler_replaced"
    t.boolean "headers_replaced"
    t.boolean "resonators_added"
    t.boolean "pipes_replaced"
    t.boolean "exhaust_tips_replaced"
    t.boolean "upstream_o2_replaced"
    t.boolean "downstream_o2_replaced"
    t.boolean "repair_only"
    t.text "notes"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_exhaust_services_on_service_record_id"
  end

  create_table "fuel_pump_services", force: :cascade do |t|
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_fuel_pump_services_on_service_record_id"
  end

  create_table "headlights", force: :cascade do |t|
    t.string "data"
  end

  create_table "license_plate_lights", force: :cascade do |t|
    t.string "data"
  end

  create_table "light_services", force: :cascade do |t|
    t.bigint "headlight_id"
    t.bigint "taillight_id"
    t.bigint "turn_signal_light_id"
    t.bigint "license_plate_light_id"
    t.boolean "replaced_all_headlights"
    t.boolean "replaced_all_taillights"
    t.boolean "replaced_all_turn_signals"
    t.boolean "other_light_changed"
    t.text "other_light_notes"
    t.bigint "service_record_id"
    t.index ["headlight_id"], name: "index_light_services_on_headlight_id"
    t.index ["license_plate_light_id"], name: "index_light_services_on_license_plate_light_id"
    t.index ["service_record_id"], name: "index_light_services_on_service_record_id"
    t.index ["taillight_id"], name: "index_light_services_on_taillight_id"
    t.index ["turn_signal_light_id"], name: "index_light_services_on_turn_signal_light_id"
  end

  create_table "maf_map_sensor_services", force: :cascade do |t|
    t.bigint "maf_map_sensors_id"
    t.bigint "service_record_id"
    t.index ["maf_map_sensors_id"], name: "index_maf_map_sensor_services_on_maf_map_sensors_id"
    t.index ["service_record_id"], name: "index_maf_map_sensor_services_on_service_record_id"
  end

  create_table "maf_map_sensors", force: :cascade do |t|
    t.string "data"
  end

  create_table "misc_services", force: :cascade do |t|
    t.text "part_description"
    t.text "notes"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_misc_services_on_service_record_id"
  end

  create_table "plugs_coils_services", force: :cascade do |t|
    t.bigint "spark_plugs_id"
    t.boolean "replaced_all_spark_plugs"
    t.text "spark_plug_notes"
    t.bigint "coil_packs_id"
    t.boolean "replaced_all_coil_packs"
    t.text "coil_pack_notes"
    t.bigint "service_record_id"
    t.index ["coil_packs_id"], name: "index_plugs_coils_services_on_coil_packs_id"
    t.index ["service_record_id"], name: "index_plugs_coils_services_on_service_record_id"
    t.index ["spark_plugs_id"], name: "index_plugs_coils_services_on_spark_plugs_id"
  end

  create_table "serpentine_belts", force: :cascade do |t|
    t.string "data"
  end

  create_table "service_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.date "service_date"
    t.integer "mileage"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_service_records_on_car_id"
    t.index ["user_id"], name: "index_service_records_on_user_id"
  end

  create_table "shocks_struts", force: :cascade do |t|
    t.string "data"
  end

  create_table "spark_plugs", force: :cascade do |t|
    t.string "data"
  end

  create_table "starter_services", force: :cascade do |t|
    t.boolean "rebuilt"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_starter_services_on_service_record_id"
  end

  create_table "suspension_services", force: :cascade do |t|
    t.bigint "shocks_struts_id"
    t.boolean "front_shocks"
    t.boolean "front_struts"
    t.boolean "rear_shocks"
    t.boolean "rear_struts"
    t.boolean "additional_suspension_parts"
    t.text "additional_notes"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_suspension_services_on_service_record_id"
    t.index ["shocks_struts_id"], name: "index_suspension_services_on_shocks_struts_id"
  end

  create_table "taillights", force: :cascade do |t|
    t.string "data"
  end

  create_table "thermostat_services", force: :cascade do |t|
    t.bigint "thermostat_id"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_thermostat_services_on_service_record_id"
    t.index ["thermostat_id"], name: "index_thermostat_services_on_thermostat_id"
  end

  create_table "thermostats", force: :cascade do |t|
    t.string "data"
  end

  create_table "throttle_position_sensors", force: :cascade do |t|
    t.string "data"
  end

  create_table "throttle_services", force: :cascade do |t|
    t.bigint "throttle_position_sensor_id"
    t.boolean "integrated"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_throttle_services_on_service_record_id"
    t.index ["throttle_position_sensor_id"], name: "index_throttle_services_on_throttle_position_sensor_id"
  end

  create_table "timing_chains", force: :cascade do |t|
    t.string "data"
  end

  create_table "timing_services", force: :cascade do |t|
    t.bigint "timing_chain_id"
    t.boolean "timing_chain_replaced"
    t.boolean "timing_chain_replaced_all"
    t.text "timing_chain_notes"
    t.bigint "timing_sprockets_id"
    t.boolean "intake_sprocket_replaced"
    t.text "intake_sprocket_notes"
    t.boolean "exhaust_sprocket_replaced"
    t.text "exhaust_sprocket_notes"
    t.bigint "timing_tensioners_id"
    t.boolean "tensioners_replaced"
    t.boolean "tensioners_replaced_all"
    t.text "tensioner_notes"
    t.bigint "crankshaft_sprocket_id"
    t.boolean "crankshaft_sprocket_replaced"
    t.bigint "service_record_id"
    t.index ["crankshaft_sprocket_id"], name: "index_timing_services_on_crankshaft_sprocket_id"
    t.index ["service_record_id"], name: "index_timing_services_on_service_record_id"
    t.index ["timing_chain_id"], name: "index_timing_services_on_timing_chain_id"
    t.index ["timing_sprockets_id"], name: "index_timing_services_on_timing_sprockets_id"
    t.index ["timing_tensioners_id"], name: "index_timing_services_on_timing_tensioners_id"
  end

  create_table "timing_sprockets", force: :cascade do |t|
    t.string "data"
  end

  create_table "timing_tensioners", force: :cascade do |t|
    t.string "data"
  end

  create_table "tire_brands", force: :cascade do |t|
    t.string "data"
  end

  create_table "tire_services", force: :cascade do |t|
    t.bigint "tire_size_id"
    t.bigint "tire_brand_id"
    t.boolean "tires_rotated"
    t.boolean "front_tires_replaced"
    t.boolean "rear_tires_replaced"
    t.boolean "tire_pressure_sensors_replaced"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_tire_services_on_service_record_id"
    t.index ["tire_brand_id"], name: "index_tire_services_on_tire_brand_id"
    t.index ["tire_size_id"], name: "index_tire_services_on_tire_size_id"
  end

  create_table "tire_sizes", force: :cascade do |t|
    t.string "data"
  end

  create_table "transmission_fluid_quantities", force: :cascade do |t|
    t.string "data"
  end

  create_table "transmission_fluid_types", force: :cascade do |t|
    t.string "data"
  end

  create_table "transmission_services", force: :cascade do |t|
    t.bigint "transmission_fluid_type_id"
    t.bigint "transmission_fluid_quantity_id"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_transmission_services_on_service_record_id"
    t.index ["transmission_fluid_quantity_id"], name: "index_transmission_services_on_transmission_fluid_quantity_id"
    t.index ["transmission_fluid_type_id"], name: "index_transmission_services_on_transmission_fluid_type_id"
  end

  create_table "turn_signal_lights", force: :cascade do |t|
    t.string "data"
  end

  create_table "user_cars", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.index ["car_id"], name: "index_user_cars_on_car_id"
    t.index ["user_id"], name: "index_user_cars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "firebase_uid"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firebase_uid"], name: "index_users_on_firebase_uid", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vvt_solenoids", force: :cascade do |t|
    t.string "data"
  end

  create_table "wiper_blade_services", force: :cascade do |t|
    t.bigint "wiper_blade_sizes_id"
    t.bigint "service_record_id"
    t.index ["service_record_id"], name: "index_wiper_blade_services_on_service_record_id"
    t.index ["wiper_blade_sizes_id"], name: "index_wiper_blade_services_on_wiper_blade_sizes_id"
  end

  create_table "wiper_blade_sizes", force: :cascade do |t|
    t.string "data"
  end

  add_foreign_key "alternator_services", "service_records"
  add_foreign_key "battery_services", "batteries"
  add_foreign_key "battery_services", "service_records"
  add_foreign_key "belt_services", "serpentine_belts"
  add_foreign_key "belt_services", "service_records"
  add_foreign_key "brake_changes", "brake_fluid_types"
  add_foreign_key "brake_changes", "brake_pads", column: "brake_pads_id"
  add_foreign_key "brake_changes", "brake_rotors", column: "brake_rotors_id"
  add_foreign_key "brake_changes", "service_records"
  add_foreign_key "cabin_air_filter_services", "cabin_air_filters"
  add_foreign_key "cabin_air_filter_services", "service_records"
  add_foreign_key "car_specs", "batteries"
  add_foreign_key "car_specs", "brake_fluid_types"
  add_foreign_key "car_specs", "brake_pads", column: "brake_pads_id"
  add_foreign_key "car_specs", "brake_rotors", column: "brake_rotors_id"
  add_foreign_key "car_specs", "cabin_air_filters"
  add_foreign_key "car_specs", "cars"
  add_foreign_key "car_specs", "coolant_types"
  add_foreign_key "car_specs", "engine_air_filters"
  add_foreign_key "car_specs", "engine_oil_filters"
  add_foreign_key "car_specs", "engine_oil_quantities"
  add_foreign_key "car_specs", "engine_oil_viscosities"
  add_foreign_key "car_specs", "headlights", column: "headlights_id"
  add_foreign_key "car_specs", "license_plate_lights"
  add_foreign_key "car_specs", "serpentine_belts"
  add_foreign_key "car_specs", "taillights", column: "taillights_id"
  add_foreign_key "car_specs", "thermostats"
  add_foreign_key "car_specs", "tire_brands"
  add_foreign_key "car_specs", "tire_sizes"
  add_foreign_key "car_specs", "transmission_fluid_quantities"
  add_foreign_key "car_specs", "transmission_fluid_types"
  add_foreign_key "car_specs", "turn_signal_lights", column: "turn_signal_lights_id"
  add_foreign_key "car_specs", "wiper_blade_sizes", column: "wiper_blade_sizes_id"
  add_foreign_key "coolant_services", "coolant_types"
  add_foreign_key "coolant_services", "service_records"
  add_foreign_key "electrical_timing_services", "camshaft_position_sensors", column: "camshaft_position_sensors_id"
  add_foreign_key "electrical_timing_services", "crankshaft_position_sensors"
  add_foreign_key "electrical_timing_services", "service_records"
  add_foreign_key "electrical_timing_services", "vvt_solenoids", column: "vvt_solenoids_id"
  add_foreign_key "engine_air_filter_services", "engine_air_filters"
  add_foreign_key "engine_air_filter_services", "service_records"
  add_foreign_key "engine_oil_changes", "engine_oil_filters", column: "oil_filter_id"
  add_foreign_key "engine_oil_changes", "engine_oil_quantities", column: "oil_quantity_id"
  add_foreign_key "engine_oil_changes", "engine_oil_viscosities", column: "oil_viscosity_id"
  add_foreign_key "engine_oil_changes", "service_records"
  add_foreign_key "exhaust_services", "service_records"
  add_foreign_key "fuel_pump_services", "service_records"
  add_foreign_key "light_services", "headlights"
  add_foreign_key "light_services", "license_plate_lights"
  add_foreign_key "light_services", "service_records"
  add_foreign_key "light_services", "taillights"
  add_foreign_key "light_services", "turn_signal_lights"
  add_foreign_key "maf_map_sensor_services", "maf_map_sensors", column: "maf_map_sensors_id"
  add_foreign_key "maf_map_sensor_services", "service_records"
  add_foreign_key "misc_services", "service_records"
  add_foreign_key "plugs_coils_services", "coil_packs", column: "coil_packs_id"
  add_foreign_key "plugs_coils_services", "service_records"
  add_foreign_key "plugs_coils_services", "spark_plugs", column: "spark_plugs_id"
  add_foreign_key "service_records", "cars"
  add_foreign_key "service_records", "users"
  add_foreign_key "starter_services", "service_records"
  add_foreign_key "suspension_services", "service_records"
  add_foreign_key "suspension_services", "shocks_struts", column: "shocks_struts_id"
  add_foreign_key "thermostat_services", "service_records"
  add_foreign_key "thermostat_services", "thermostats"
  add_foreign_key "throttle_services", "service_records"
  add_foreign_key "throttle_services", "throttle_position_sensors"
  add_foreign_key "timing_services", "crankshaft_sprockets"
  add_foreign_key "timing_services", "service_records"
  add_foreign_key "timing_services", "timing_chains"
  add_foreign_key "timing_services", "timing_sprockets", column: "timing_sprockets_id"
  add_foreign_key "timing_services", "timing_tensioners", column: "timing_tensioners_id"
  add_foreign_key "tire_services", "service_records"
  add_foreign_key "tire_services", "tire_brands"
  add_foreign_key "tire_services", "tire_sizes"
  add_foreign_key "transmission_services", "service_records"
  add_foreign_key "transmission_services", "transmission_fluid_quantities"
  add_foreign_key "transmission_services", "transmission_fluid_types"
  add_foreign_key "user_cars", "cars"
  add_foreign_key "user_cars", "users"
  add_foreign_key "wiper_blade_services", "service_records"
  add_foreign_key "wiper_blade_services", "wiper_blade_sizes", column: "wiper_blade_sizes_id"
end
