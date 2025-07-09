class Jobs::BeltService < ApplicationRecord
    self.table_name = "belt_services"
  belongs_to :service_record
  belongs_to :serpentine_belt, class_name: "Parts::SerpentineBelt"
end
