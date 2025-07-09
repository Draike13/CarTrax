class Parts::CoilPack < ApplicationRecord
  has_many :plugs_coils_services, class_name: "Jobs::PlugsCoilsService"
end
