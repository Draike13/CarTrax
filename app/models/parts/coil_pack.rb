class Parts::CoilPack < ApplicationRecord
  self.table_name = "coil_packs"
  has_many :plugs_coils_services, class_name: "Jobs::PlugsCoilsService"
end
