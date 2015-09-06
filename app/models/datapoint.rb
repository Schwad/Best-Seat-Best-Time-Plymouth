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
end
