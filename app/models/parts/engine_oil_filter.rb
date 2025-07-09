class Parts::EngineOilFilter < ApplicationRecord
  has_many :car_specs
  has_many :engine_oil_changes, class_name: "Jobs::EngineOilChange"
end
