class Jobs::ExhaustService < ApplicationRecord
  self.table_name = "exhaust_services"
  belongs_to :service_record
end
