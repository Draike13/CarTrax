class CreateJobAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :job_assignments do |t|
      t.references :service_record, null: false, foreign_key: true
      t.references :job, polymorphic: true, null: false
      t.timestamps
    end
  end
end
