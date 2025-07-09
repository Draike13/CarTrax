class RemoveUserIdFromServiceRecords < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :service_records, :users
    remove_index :service_records, :user_id
    remove_column :service_records, :user_id, :bigint
  end
end
