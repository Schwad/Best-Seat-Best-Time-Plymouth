module ApplicationHelper

  def updates_my_config
    puts "Now updating config..."
    @rooms = Datapoint.select("room_name").group("room_name")
    Rails.application.config.my_config = Hash.new()
    Rails.application.config.my_config["range"] = (0..23).to_a

    @rooms.each do |room|

      my_day_array = []
      my_room = Day.where("room_name = ?", room.room_name).last
      puts "Now doing #{my_room.room_name}"
      my_room.attributes.each do |such_attribute|
        my_day_array << such_attribute
      end

      Rails.application.config.my_config[my_room.room_name] = []

      my_day_array[2..-3].each do |room_hour|
        Rails.application.config.my_config[my_room.room_name] << room_hour[1]
        puts "Stored in #{room_hour[1]} for #{my_room.room_name}"
      end
    end
  end


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
        starter = []
        starter << val
        starter << @array_of_total[index]
        starter << (val / @array_of_total[index])
      @array_answer << starter
    rescue
      puts "problem line 32"
      binding.pry
    end
      puts @array_answer[-1]
    end

  end

  def build_data
    @array_of_rooms.each_with_index do |val, index|
      begin
        Datapoint.create(
          :free => @array_answer[index][2],
          :total_rooms => @array_answer[index][1].to_i,
          :total_available => @array_answer[index][0].to_i,
          :room_name => val
          )
      rescue
        binding.pry
      end
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
      my_day = Day.new(
        :room_name => room.room_name,
        :full_data => [0]
        )
      @new_value.each do |my_value|
        my_day.full_data << my_value
      end
      if my_day.save
        puts "Now stored data for #{room.room_name}!"
      end
    end
  end
end
