# app/models/jobs/engine_oil_change.rb
class Jobs::EngineOilChange < ApplicationRecord
  belongs_to :service_record
  belongs_to :oil_viscosity, class_name: "Parts::EngineOilViscosity"
  belongs_to :oil_filter, class_name: "Parts::EngineOilFilter"
  belongs_to :oil_quantity, class_name: "Parts::EngineOilQuantity"
end
