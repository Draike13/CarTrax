class FixPluralIssueOnModels < ActiveRecord::Migration[8.0]
  def change
    rename_column :brake_changes, :brake_pads_id, :brake_pad_id
    rename_column :brake_changes, :brake_rotors_id, :brake_rotor_id

    rename_column :electrical_timing_services, :camshaft_position_sensors_id, :camshaft_position_sensor_id

    rename_column :plugs_coils_services, :spark_plugs_id, :spark_plug_id
    rename_column :plugs_coils_services, :coil_packs_id, :coil_pack_id

    rename_column :maf_map_sensor_services, :maf_map_sensors_id, :maf_map_sensor_id

    rename_column :wiper_blade_services, :wiper_blade_sizes_id, :wiper_blade_size_id

    rename_column :timing_services, :timing_sprockets_id, :timing_sprocket_id
    rename_column :timing_services, :timing_tensioners_id, :timing_tensioner_id

    rename_column :electrical_timing_services, :vvt_solenoids_id, :vvt_solenoid_id
  end
end
