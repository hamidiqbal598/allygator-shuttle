class Location < ApplicationRecord

  belongs_to :vehicle
  delegate :station, :to => :vehicle, :allow_nil => true

  # Here calculating other values like distance, angle and direction
  # All calculation are done by using Geocoder
  def set_defaults

    response = "AllOK"
    location_coordinates = [self.latitude, self.longitude]

    station = self.vehicle.station
    station_coordinates = [station.latitude, station.longitude]

    last_location = Location.where(vehicle_id: self.vehicle_id).order(id: :desc).first

    # To check either new location exceeding from the boundry or not
    self.distance = (Geocoder::Calculations.distance_between(station_coordinates,location_coordinates, options = {units: :km})).to_f
    unless self.distance <= station.radius
      response = "ExceedCityBoundaries"
    end

    # Specific check for the last location either available or not
    # If available then angle calculated from last location
    # Otherwise from the station location
    if last_location.nil?
      angle = Geocoder::Calculations.bearing_between(station_coordinates, location_coordinates)
      self.angle = angle.to_s
      self.direction = (Geocoder::Calculations.compass_point(angle, points = %w[N NE E SE S SW W NW])).to_s
    else
      last_location_coordinates = [last_location.latitude, last_location.longitude]
      if (last_location.recorded_at + 3.seconds) < (self.recorded_at)
        angle = Geocoder::Calculations.bearing_between(last_location_coordinates, location_coordinates)
        self.angle = angle.to_s
        self.direction = (Geocoder::Calculations.compass_point(angle, points = %w[N NE E SE S SW W NW])).to_s
      else
        response = "LessThan3Seconds"
      end
    end
    response

  end

end
