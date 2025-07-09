class GasketJobsAndParts < ActiveRecord::Migration[8.0]
  def change
    # === PARTS ===
    create_table :valve_cover_gaskets do |t|
      t.string :data
      t.timestamps
    end

    create_table :head_gaskets do |t|
      t.string :data
      t.timestamps
    end

    # === JOBS ===
    create_table :valve_cover_gasket_changes do |t|
      t.references :valve_cover_gasket, foreign_key: true
      t.boolean :replaced_bank_one, default: false
      t.boolean :replaced_bank_two, default: false
      t.text :notes
      t.references :service_record, foreign_key: true
      t.timestamps
    end

    create_table :head_gasket_replacements do |t|
      t.references :head_gasket, foreign_key: true
      t.boolean :replaced_bank_one, default: false
      t.boolean :replaced_bank_two, default: false
      t.text :notes
      t.references :service_record, foreign_key: true
      t.timestamps
    end
  end
end
