class RenameCarSpecParts < ActiveRecord::Migration[8.0]
  def change
    rename_column :car_specs, :brake_pads_id, :brake_pad_id
    rename_column :car_specs, :brake_rotors_id, :brake_rotor_id
    rename_column :car_specs, :wiper_blade_sizes_id, :wiper_blade_size_id
    rename_column :car_specs, :headlights_id, :headlight_id
    rename_column :car_specs, :taillights_id, :taillight_id
    rename_column :car_specs, :turn_signal_lights_id, :turn_signal_light_id

    if index_name_exists?(:car_specs, "index_car_specs_on_brake_pads_id")
      rename_index :car_specs, "index_car_specs_on_brake_pads_id", "index_car_specs_on_brake_pad_id"
    end

    if index_name_exists?(:car_specs, "index_car_specs_on_brake_rotors_id")
      rename_index :car_specs, "index_car_specs_on_brake_rotors_id", "index_car_specs_on_brake_rotor_id"
    end

    if index_name_exists?(:car_specs, "index_car_specs_on_wiper_blade_sizes_id")
      rename_index :car_specs, "index_car_specs_on_wiper_blade_sizes_id", "index_car_specs_on_wiper_blade_size_id"
    end

    if index_name_exists?(:car_specs, "index_car_specs_on_headlights_id")
      rename_index :car_specs, "index_car_specs_on_headlights_id", "index_car_specs_on_headlight_id"
    end

    if index_name_exists?(:car_specs, "index_car_specs_on_taillights_id")
      rename_index :car_specs, "index_car_specs_on_taillights_id", "index_car_specs_on_taillight_id"
    end

    if index_name_exists?(:car_specs, "index_car_specs_on_turn_signal_lights_id")
      rename_index :car_specs, "index_car_specs_on_turn_signal_lights_id", "index_car_specs_on_turn_signal_light_id"
    end
  end
end
