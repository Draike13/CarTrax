class Jobs::PlugsCoilsService < ApplicationRecord
  self.table_name = "plugs_coils_services"
  belongs_to :service_record
  belongs_to :spark_plug, class_name: "Parts::SparkPlug"
  belongs_to :coil_pack, class_name: "Parts::CoilPack"
end
