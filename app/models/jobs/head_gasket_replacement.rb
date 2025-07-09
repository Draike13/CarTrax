class Jobs::HeadGasketReplacement < ApplicationRecord
  belongs_to :service_record
  belongs_to :head_gasket, class_name: "Parts::HeadGasket"
end
