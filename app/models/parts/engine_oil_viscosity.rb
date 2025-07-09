class Parts::EngineOilViscosity < ApplicationRecord
  self.table_name = "engine_oil_viscosities"
  has_many :car_specs
  has_many :engine_oil_changes, class_name: "Jobs::EngineOilChange"
end
