class Datapoint < ActiveRecord::Base
  belongs_to :room

  def average_capacity(room_name)
    all_data = Datapoint.where("room_name = ?", room_name)
    number_of_points = 0
    total = 0
    all_data.each do |datapointz|
      total += datapointz.free
      number_of_points += 1
    end
    answer = total.to_f / number_of_points.to_f
    return answer
  end

  def average_capacity_by_time_of_day(room_name, hour)
    my_rooms = Datapoint.where("room_name = ?", room_name)
    @total = 0
    @divisor = 0

    my_rooms.each do |room|
       if room.created_at.hour == hour
         @total += 1
        @divisor += room.free
       end
     end
     if @total == 0
      answer = 10
     else
       answer = ((@divisor.to_f / @total.to_f) * 100).to_i
     end

     return answer
  end
end
