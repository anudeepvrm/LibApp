set :output, '~/whenever.log'
set :environment,'development'

  every 30.minutes, at: 00, :environment => :development do
    runner "Bookedroom.where(\"booking_time=?\",Time.now.beginning_of_minute).destroy_all"
    command "echo 'Start'"
  end

