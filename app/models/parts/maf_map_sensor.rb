class Parts::MafMapSensor < ApplicationRecord
  has_many :maf_map_sensor_services, class_name: "Jobs::MafMapSensorService"
end
