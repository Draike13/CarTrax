class Jobs::ValveCoverGasketChange < ApplicationRecord
  belongs_to :service_record
  belongs_to :valve_cover_gasket, class_name: "Parts::ValveCoverGasket"
end
