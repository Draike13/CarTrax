class Car < ApplicationRecord
  has_many :user_cars
  has_many :users, through: :user_cars
  has_one :car_spec, dependent: :destroy
end
