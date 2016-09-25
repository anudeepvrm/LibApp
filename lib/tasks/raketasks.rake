namespace :raketasks do
  desc "Delete records older than 120 minutes"
  task deleteOldRecords: :environment do
    puts "in rake task"
    #current_time = Time.new
    Bookedroom.where(:booking_time=>Time.now.beginning_of_minute).destroy_all
  end

end
