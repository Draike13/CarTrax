class Parts::TimingTensioner < ApplicationRecord
  self.table_name = "timing_tensioners"
  has_many :timing_services, class_name: "Jobs::TimingService"
end
