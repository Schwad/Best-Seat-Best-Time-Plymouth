class RoomsController < ApplicationController
  def index
    @rooms =  Datapoint.select("room_name").group("room_name")
    @room_array = []
    @rooms.each do |room|
      @room_array << room.room_name
    end
  end

  def display_props
    @rooms = Datapoint.all

  end
end
