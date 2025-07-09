class Jobs::CoolantService < ApplicationRecord
  self.table_name = "coolant_services"
  belongs_to :service_record
  belongs_to :coolant, class_name: "Parts::Coolant"
end
