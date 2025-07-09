class Parts::LicensePlateLight < ApplicationRecord
  self.table_name = "license_plate_lights"
  has_many :car_specs
  has_many :light_services, class_name: "Jobs::LightService"
end
