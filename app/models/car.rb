class Car < ApplicationRecord
  has_many :user_cars
  has_many :users, through: :user_cars
  has_many :service_records
  has_one :car_spec, dependent: :destroy
end
