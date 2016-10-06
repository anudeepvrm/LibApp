class Room < ApplicationRecord
  has_many :bookedroom
  attr_accessor :status
  attr_accessor :date
  attr_accessor :time
  validates :roomno, :uniqueness => true

  def history
  	return Bookinghistory.where("room_no = " + self.roomno.to_s)
  end

  def to_s
  	return self.roomno.to_s + ", " + self.building
  end

  def history_html
  	s = ""
  	self.history.each do |booking|
  		s += booking.to_s + "<br>"
  	end
  	return s.html_safe
  end
end
