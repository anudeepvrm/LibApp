module BookedroomsHelper
  def clear_booked_rooms_after_2_hours
    time=Time.now
    bookedrooms=Bookedroom.where("booking_time=?",time.beginning_of_minute)
    bookedrooms.each do |bookedroom|
      bookedroom.destroy
    end
    end
end