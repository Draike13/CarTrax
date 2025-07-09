class Jobs::BeltService < ApplicationRecord
  belongs_to :service_record
  belongs_to :serpentine_belt, class_name: "Parts::SerpentineBelt"
end
