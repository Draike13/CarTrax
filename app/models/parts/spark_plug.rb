class Parts::SparkPlug < ApplicationRecord
  self.table_name = "spark_plugs"
  has_many :plugs_coils_services, class_name: "Jobs::PlugsCoilsService"
end
