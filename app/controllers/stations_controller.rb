class StationsController < ApplicationController

  include Singleton
  before_action :set_station, only: %i[ show ]

  def index
    link_to 'Show', Station.first
  end

  def show
    #Getting the needed values for stations show function
    @vehicles = @station.vehicles
    @vehicle = @vehicles.find_by(id: params[:vehicle_id]) unless params[:vehicle_id].blank?
    @locations = @vehicle.try(:locations)
    render 'index'
  end

  private
    def set_station
      #Setting station function
      unless params[:id].blank?
        @station = Station.find(params[:id])
      else
        @station = Station.find(1)
      end
    end

    def set_vehicle
      #Setting Vehicle function
      unless params[:vehicle_id].blank?
        @vehicle = Vehicle.find(params[:vehicle_id])
      else
        @vehicle = Vehicle.find(1)
      end
    end

    def station_params
      params.require(:station).permit(:latitude, :longitude, :name, :radius)
    end
end
