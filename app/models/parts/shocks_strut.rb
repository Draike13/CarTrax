class Parts::ShocksStrut < ApplicationRecord
  has_many :suspension_services, class_name: "Jobs::SuspensionService"
end
