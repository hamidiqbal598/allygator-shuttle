class Vehicle < ApplicationRecord

  #Creating relations with other models
  belongs_to :station
  has_many :locations

end
