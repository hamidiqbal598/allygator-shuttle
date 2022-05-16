class VehicleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vehicle_channel_#{params[:vehicle_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
