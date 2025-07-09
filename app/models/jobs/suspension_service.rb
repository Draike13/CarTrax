class Jobs::SuspensionService < ApplicationRecord
  self.table_name = "suspension_services"
  belongs_to :service_record
  belongs_to :shocks_strut, class_name: "Parts::ShocksStrut"
end
