class RoomsController < ApplicationController
  def index
    @rooms =  Datapoint.select("room_name").group("room_name")
    @thingy = Datapoint.first
    @overall_change = []

  end

  def display_props
    @rooms = Datapoint.all
  end
end
