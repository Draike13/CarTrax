class Parts::ValveCoverGasket < ApplicationRecord
  has_many :valve_cover_gasket_changes, class_name: "Jobs::ValveCoverGasketChange"
end
