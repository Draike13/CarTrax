class Jobs::MafMapSensorService < ApplicationRecord
  self.table_name = "maf_map_sensor_services"
  belongs_to :service_record
  belongs_to :maf_map_sensor, class_name: "Parts::MafMapSensor"
end
