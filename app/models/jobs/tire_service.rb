class Jobs::TireService < ApplicationRecord
  belongs_to :service_record
  belongs_to :tire_brand, class_name: "Parts::TireBrand"
  belongs_to :tire_size, class_name: "Parts::TireSize"
end
