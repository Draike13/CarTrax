class Parts::CrankshaftSprocket < ApplicationRecord
  self.table_name = "crankshaft_sprockets"
  has_many :timing_services, class_name: "Jobs::TimingService"
end
