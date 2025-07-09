class Jobs::WiperBladeService < ApplicationRecord
  self.table_name = "wiper_blade_services"
  belongs_to :service_record
  belongs_to :wiper_blade_size, class_name: "Parts::WiperBladeSize"
end
