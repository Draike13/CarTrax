class Parts::BrakePad < ApplicationRecord
  self.table_name = "brake_pads"
  has_many :car_specs
  has_many :brake_changes, class_name: "Jobs::BrakeChange"
end
