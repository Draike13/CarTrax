class Parts::MafMapSensor < ApplicationRecord
  self.table_name = "maf_map_sensors"
  has_many :maf_map_sensor_services, class_name: "Jobs::MafMapSensorService"
end
