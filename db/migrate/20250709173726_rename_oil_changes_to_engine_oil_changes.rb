class RenameOilChangesToEngineOilChanges < ActiveRecord::Migration[8.0]
  def change
    rename_table :oil_changes, :engine_oil_changes
  end
end
