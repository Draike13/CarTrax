class Parts::EngineOilFilter < ApplicationRecord
  self.table_name = "engine_oil_filters"
  has_many :car_specs
  has_many :engine_oil_changes, class_name: "Jobs::EngineOilChange"
end
