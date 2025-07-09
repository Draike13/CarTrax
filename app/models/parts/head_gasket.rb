class Parts::HeadGasket < ApplicationRecord
  has_many :head_gasket_replacements, class_name: "Jobs::HeadGasketReplacement"
end
