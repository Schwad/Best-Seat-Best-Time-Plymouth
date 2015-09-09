module ApplicationHelper
  def scrape_page
    a = Mechanize.new
    a = a.get('https://ict-webtools.plymouth.ac.uk/pcfinder/OpenAccess.aspx?loc=Plymouth')

    @array_of_availability = []

    @array_of_rooms = []

    @array_of_total = []

    a.search('tr td:nth-child(1)').each do |row|
        @array_of_rooms << row.text
    end
    a.search('tr td:nth-child(2)').each do |row|
       @array_of_availability << row.text.to_f
    end

    a.search('tr td:nth-child(3)').each do |row|
      @array_of_total << row.text.to_f
    end

    @array_answer = []

    @array_of_availability.each_with_index do |val, index|
      begin
      @array_answer << (val / @array_of_total[index])
    rescue
      puts "problem line 32"
      binding.pry
    end
      puts @array_answer[-1]
    end

  end

  def build_data
    @array_of_rooms.each_with_index do |val, index|
      Datapoint.create(
        :free => @array_answer[index],
        :room_name => val
        )
      puts "#{val} at #{@array_answer[index]}"
    end
  end

  def initialize_rooms


  end

  def write_averages_to_json_file_for_quick_reading
    @rooms =  Datapoint.select("room_name").group("room_name")
    @thingy = Datapoint.first
    #how to do a hash in a hash? necessary next

    @rooms.each do |room|
      @range = (0..23)
      @new_value = []
      @range.each do |hour|
        @new_value << @thingy.average_capacity_by_time_of_day(room.room_name, hour)
      end
      Day.create(
        :room_name => room.room_name,
        :hour_0 => @new_value[0],
        :hour_1 => @new_value[1],
        :hour_2 => @new_value[2],
        :hour_3 => @new_value[3],
        :hour_4 => @new_value[4],
        :hour_5 => @new_value[5],
        :hour_6 => @new_value[6],
        :hour_7 => @new_value[7],
        :hour_8 => @new_value[8],
        :hour_9 => @new_value[9],
        :hour_10 => @new_value[10],
        :hour_11 => @new_value[11],
        :hour_12 => @new_value[12],
        :hour_13 => @new_value[13],
        :hour_14 => @new_value[14],
        :hour_15 => @new_value[15],
        :hour_16 => @new_value[16],
        :hour_17 => @new_value[17],
        :hour_18 => @new_value[18],
        :hour_19 => @new_value[19],
        :hour_20 => @new_value[20],
        :hour_21 => @new_value[21],
        :hour_22 => @new_value[22],
        :hour_23 => @new_value[23]
        )
      puts "Now stored data for #{room.room_name}!"
    end
  end
end
