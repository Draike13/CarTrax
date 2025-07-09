class Jobs::AlternatorService < ApplicationRecord
  self.table_name = "alternator_services"
  belongs_to :service_record
end
