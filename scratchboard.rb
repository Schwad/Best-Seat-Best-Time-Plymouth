require 'mechanize'

a = Mechanize.new
a = a.get('https://ict-webtools.plymouth.ac.uk/pcfinder/OpenAccess.aspx?loc=Plymouth')

array_of_availability = []

a.search('tr td:nth-child(2)').each do |row|
   array_of_availability << row.text
end