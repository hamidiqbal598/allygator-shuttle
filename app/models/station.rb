class Station < ApplicationRecord

  has_many :vehicles
  has_many :locations, through: :vehicles

  accepts_nested_attributes_for :vehicles

end
