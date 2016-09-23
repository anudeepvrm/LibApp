namespace :raketasks do
  desc "Delete records older than 120 minutes"
  task deleteOldRecords: :environment do
    puts "in rake task"
    #current_time = Time.new
    Bookedroom.delete_all("created_at > #{120.minutes.ago}").each { |model| model.destroy }
  end

end
