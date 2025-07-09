class Parts::ValveCoverGasket < ApplicationRecord
  self.table_name = "valve_cover_gaskets"
  has_many :valve_cover_gasket_changes, class_name: "Jobs::ValveCoverGasketChange"
end
