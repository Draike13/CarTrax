class Parts::TimingSprocket < ApplicationRecord
  has_many :timing_services, class_name: "Jobs::TimingService"
end
