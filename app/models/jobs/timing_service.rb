class Jobs::TimingService < ApplicationRecord
  belongs_to :service_record
  belongs_to :timing_chain, class_name: "Parts::TimingChain"
  belongs_to :timing_sprocket, class_name: "Parts::TimingSprocket"
  belongs_to :timing_tensioner, class_name: "Parts::TimingTensioner"
  belongs_to :crankshaft_sprocket, class_name: "Parts::CrankshaftSprocket"
end
