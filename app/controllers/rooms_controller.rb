class RoomsController < ApplicationController
  def index
    @rooms =  Datapoint.select("room_name").group("room_name")

  end

  def display_props
    @rooms = Datapoint.all

  end
end
