class Parts::TimingChain < ApplicationRecord
  self.table_name = "timing_chains"
  has_many :timing_services, class_name: "Jobs::TimingService"
end
