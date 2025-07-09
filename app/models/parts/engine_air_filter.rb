class Parts::EngineAirFilter < ApplicationRecord
  has_many :car_specs
  has_many :engine_air_filter_services, class_name: "Jobs::EngineAirFilterService"
end
