class ApplicationController < ActionController::Base
  
  #CMD
  # rails g scaffold station latitude:float longitude:float name:string radius:float
  # rails g scaffold vehicle route:string uid:string station:references
  # rails g scaffold location latitude:float longitude:float recorded_at:datetime angle:string vehicle:references
  # rails g channel vehicle
  #

  require 'singleton'

end
