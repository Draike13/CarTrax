class Parts::BrakePad < ApplicationRecord
  has_many :car_specs
  has_many :brake_changes, class_name: "Jobs::BrakeChange"
end
