class Jobs::WiperBladeService < ApplicationRecord
  belongs_to :service_record
  belongs_to :wiper_blade_size, class_name: "Parts::WiperBladeSize"
end
