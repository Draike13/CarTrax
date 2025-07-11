class Car < ApplicationRecord
  has_many :car_ownerships
  has_many :customers, through: :car_ownerships
  has_many :service_records
  has_one :car_spec, dependent: :destroy
end
