class Vehicle < ApplicationRecord

  belongs_to :station
  has_many :locations

end
