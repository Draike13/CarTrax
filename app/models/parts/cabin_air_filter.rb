class Parts::CabinAirFilter < ApplicationRecord
  has_many :car_specs
  has_many :cabin_air_filter_services, class_name: "Jobs::CabinAirFilterService"
end
