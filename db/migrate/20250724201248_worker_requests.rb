class WorkerRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :worker_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :admin_verified, default: false
      t.boolean :worker_verified, default: false
      t.timestamps
    end
    add_index :worker_requests, :email, unique: true
  end
end
