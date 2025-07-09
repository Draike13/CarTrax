class Jobs::SuspensionService < ApplicationRecord
  belongs_to :service_record
  belongs_to :shocks_strut, class_name: "Parts::ShocksStrut"
end
