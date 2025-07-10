class Jobs::CabinAirFilterService < ApplicationRecord
  self.table_name = "cabin_air_filter_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :cabin_air_filter, class_name: "Parts::CabinAirFilter"
end
