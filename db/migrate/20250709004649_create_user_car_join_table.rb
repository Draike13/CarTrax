class CreateUserCarJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_table :user_cars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
    end
  end
end
