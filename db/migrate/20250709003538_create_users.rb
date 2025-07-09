class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :email
      t.string :password_digest  # Optional: for future password logins
      t.string :firebase_uid     # Firebase unique identifier
      t.date :birthday

      t.timestamps
    end

    # Add indexes for fast lookups and uniqueness
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :firebase_uid, unique: true
  end
end
