class Parts::TurnSignalLight < ApplicationRecord
  self.table_name = "turn_signal_lights"
  has_many :car_specs
  has_many :light_services, class_name: "Jobs::LightService"
end
