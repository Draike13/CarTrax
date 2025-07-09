class Jobs::ValveCoverGasketChange < ApplicationRecord
  self.table_name = "valve_cover_gasket_changes"
  belongs_to :service_record
  belongs_to :valve_cover_gasket, class_name: "Parts::ValveCoverGasket"
end
