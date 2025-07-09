class Jobs::ThermostatService < ApplicationRecord
  belongs_to :service_record
  belongs_to :thermostat, class_name: "Parts::Thermostat"
end
