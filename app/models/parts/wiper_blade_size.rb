class Parts::WiperBladeSize < ApplicationRecord
  has_many :car_specs
  has_many :wiper_blade_services, class_name: "Jobs::WiperBladeService"
end
