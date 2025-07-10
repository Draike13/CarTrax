class Jobs::PlugsCoilsService < ApplicationRecord
  self.table_name = "plugs_coils_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :spark_plug, class_name: "Parts::SparkPlug"
  belongs_to :coil_pack, class_name: "Parts::CoilPack"
end
