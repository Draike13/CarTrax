class DropUserCar < ActiveRecord::Migration[8.0]
  def change
    drop_table :user_cars
  end
end
