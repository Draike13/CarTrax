class Parts::SparkPlug < ApplicationRecord
  has_many :plugs_coils_services, class_name: "Jobs::PlugsCoilsService"
end
