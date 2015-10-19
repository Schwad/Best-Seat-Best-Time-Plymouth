class Day < ActiveRecord::Base
  serialize :full_data


  def weekly_change
    room = self.room_name
    original = Day.where("room_name = ?", room).first
    total_change = 0
    original.full_data.each_with_index do |hour, index|
      difference = self.full_data[index] - hour
      total_change += difference
    end
    full_difference = total_change / 24
    return total_change
  end
end
