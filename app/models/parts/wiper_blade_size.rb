class Parts::WiperBladeSize < ApplicationRecord
  self.table_name = "wiper_blade_sizes"
  has_many :car_specs
  has_many :wiper_blade_services, class_name: "Jobs::WiperBladeService"
end
