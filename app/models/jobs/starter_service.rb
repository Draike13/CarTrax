class Jobs::StarterService < ApplicationRecord
  self.table_name = "starter_services"
  belongs_to :service_record
end
