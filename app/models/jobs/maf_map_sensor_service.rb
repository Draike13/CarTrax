class Jobs::MafMapSensorService < ApplicationRecord
  belongs_to :service_record
  belongs_to :maf_map_sensor, class_name: "Parts::MafMapSensor"
end
