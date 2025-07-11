class Customer < ApplicationRecord
  has_many :car_ownerships
  has_many :cars, through: :car_ownerships
end
