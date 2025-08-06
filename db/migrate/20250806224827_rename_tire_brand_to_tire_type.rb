class RenameTireBrandToTireType < ActiveRecord::Migration[8.0]
  def change
    rename_table :tire_brands, :tire_types

    rename_column :car_specs, :tire_brand_id, :tire_type_id
    rename_column :tire_services, :tire_brand_id, :tire_type_id
  end
end
