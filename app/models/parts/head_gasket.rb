class Parts::HeadGasket < ApplicationRecord
  self.table_name = "head_gaskets"
  has_many :head_gasket_replacements, class_name: "Jobs::HeadGasketReplacement"
end
