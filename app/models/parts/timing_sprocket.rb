class Parts::TimingSprocket < ApplicationRecord
  self.table_name = "timing_sprockets"
  has_many :timing_services, class_name: "Jobs::TimingService"
end
