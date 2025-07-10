class Jobs::TimingService < ApplicationRecord
  self.table_name = "timing_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :timing_chain, class_name: "Parts::TimingChain"
  belongs_to :timing_sprocket, class_name: "Parts::TimingSprocket"
  belongs_to :timing_tensioner, class_name: "Parts::TimingTensioner"
  belongs_to :crankshaft_sprocket, class_name: "Parts::CrankshaftSprocket"
end
