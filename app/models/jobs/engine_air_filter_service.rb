class Jobs::EngineAirFilterService < ApplicationRecord
  self.table_name = "engine_air_filter_services"
  belongs_to :service_record
  belongs_to :engine_air_filter, class_name: "Parts::EngineAirFilter"
end
