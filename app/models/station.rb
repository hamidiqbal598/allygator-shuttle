class Station < ApplicationRecord

  #Creating relations with other models
  has_many :vehicles
  has_many :locations, through: :vehicles

  accepts_nested_attributes_for :vehicles

end
