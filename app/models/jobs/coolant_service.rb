class Jobs::CoolantService < ApplicationRecord
  belongs_to :service_record
  belongs_to :coolant, class_name: "Parts::Coolant"
end
