class Parts::BrakeFluidType < ApplicationRecord
  self.table_name = "brake_fluid_types"
  has_many :car_specs
  has_many :brake_changes, class_name: "Jobs::BrakeChange"
end
