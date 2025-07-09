class Parts::EngineOilQuantity < ApplicationRecord
  self.table_name = "engine_oil_quantities"
  has_many :car_specs
  has_many :engine_oil_changes, class_name: "Jobs::EngineOilChange"
end
