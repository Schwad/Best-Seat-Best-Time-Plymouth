require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

desc "This task is called by the Heroku scheduler add-on"

  task :update_page => :environment do
    puts "Updating whole page"
    scrape_page
    build_data
  end

  task :clear_data => :environment do
    Datapoint.destroy_all
  end

  task :write_averages => :environment do
    write_averages_to_json_file_for_quick_reading
  end
