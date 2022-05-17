class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  def new
    @location = Location.new
  end

  def create
    #Creating new location and calculating values and then responded back to action cable
    @location = Location.new(location_params)
    response = @location.set_defaults
    puts response
    if response == "AllOK"
      if @location.save
        location_html = ApplicationController.render(
          partial: 'locations/location',
          locals: { location: @location, vehicle: @location.vehicle }
        )
      else
        response = "RecordNotSave"
      end
    end
    #calling action cable for specific vehicle
    ActionCable.server.broadcast "vehicle_channel_#{@location.vehicle_id}", response: response, location: @location, location_html: location_html

  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:latitude, :longitude, :recorded_at, :angle, :vehicle_id, :distance, :direction)
    end
end
