class Jobs::BeltService < ApplicationRecord
    self.table_name = "belt_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :serpentine_belt, class_name: "Parts::SerpentineBelt"
end
