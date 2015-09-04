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
end
