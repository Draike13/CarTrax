class Parts::CrankshaftSprocket < ApplicationRecord
  has_many :timing_services, class_name: "Jobs::TimingService"
end
