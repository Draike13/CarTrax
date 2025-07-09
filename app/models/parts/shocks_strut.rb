class Parts::ShocksStrut < ApplicationRecord
  self.table_name = "shocks_struts"
  has_many :suspension_services, class_name: "Jobs::SuspensionService"
end
