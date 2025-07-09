class Jobs::CabinAirFilterService < ApplicationRecord
  belongs_to :service_record
  belongs_to :cabin_air_filter, class_name: "Parts::CabinAirFilter"
end
