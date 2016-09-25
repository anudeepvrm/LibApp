namespace :raketasks do
  desc "Delete records older than 120 minutes"
  task deleteOldRecords: :environment do
    puts "in rake task"
    #current_time = Time.new
    Bookedroom.where(:booking_time=>((Time.now)-2.hours).beginning_of_hour).destroy_all
  end

end
