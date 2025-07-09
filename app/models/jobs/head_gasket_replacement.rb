class Jobs::HeadGasketReplacement < ApplicationRecord
  self.table_name = "head_gasket_replacements"
  belongs_to :service_record
  belongs_to :head_gasket, class_name: "Parts::HeadGasket"
end
