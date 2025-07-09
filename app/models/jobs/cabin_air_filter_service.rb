class Jobs::CabinAirFilterService < ApplicationRecord
  self.table_name = "cabin_air_filter_services"
  belongs_to :service_record
  belongs_to :cabin_air_filter, class_name: "Parts::CabinAirFilter"
end
