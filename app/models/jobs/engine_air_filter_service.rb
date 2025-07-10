class Jobs::EngineAirFilterService < ApplicationRecord
  self.table_name = "engine_air_filter_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :engine_air_filter, class_name: "Parts::EngineAirFilter"
end
