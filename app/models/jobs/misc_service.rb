class Jobs::MiscService < ApplicationRecord
  self.table_name = "misc_services"
  belongs_to :service_record
end
