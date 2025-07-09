class Jobs::EngineAirFilterService < ApplicationRecord
  belongs_to :service_record
  belongs_to :engine_air_filter, class_name: "Parts::EngineAirFilter"
end
