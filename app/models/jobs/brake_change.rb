class Jobs::BrakeChange < ApplicationRecord
  belongs_to :service_record
  belongs_to :brake_rotor, class_name: "Parts::BrakeRotor"
  belongs_to :brake_fluid, class_name: "Parts::BrakeFluid"
  belongs_to :brake_pad, class_name: "Parts::BrakePad"
end
