class Parts::CabinAirFilter < ApplicationRecord
  self.table_name = "cabin_air_filters"
  has_many :car_specs
  has_many :cabin_air_filter_services, class_name: "Jobs::CabinAirFilterService"
end
