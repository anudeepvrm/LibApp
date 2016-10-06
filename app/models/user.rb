class User < ApplicationRecord
  has_many :bookedroom
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, :presence => true,:uniqueness => true, if: "self.id == nil"
  validates :password, :presence => true
  validates :name, :presence => true

  def history
  	return Bookinghistory.where("user_id = " + self.id.to_s)
  end

  def to_s
  	return self.name
  end

  def history_html
  	s = ""
  	self.history.each do |booking|
  		s += booking.to_s + "<br>"
  	end
  	return s.html_safe
  end

end
