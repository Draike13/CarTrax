class Jobs::MafMapSensorService < ApplicationRecord
  self.table_name = "maf_map_sensor_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :maf_map_sensor, class_name: "Parts::MafMapSensor"
end
