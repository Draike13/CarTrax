class Jobs::LightService < ApplicationRecord
  self.table_name = "light_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :headlight, class_name: "Parts::Headlight"
  belongs_to :taillight, class_name: "Parts::Taillight"
  belongs_to :turn_signal_light, class_name: "Parts::TurnSignalLight"
  belongs_to :license_plate_light, class_name: "Parts::LicensePlateLight"
end
