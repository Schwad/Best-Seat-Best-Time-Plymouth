class RoomsController < ApplicationController
  def index
    @rooms =  Datapoint.select("room_name").group("room_name")

  end
end
