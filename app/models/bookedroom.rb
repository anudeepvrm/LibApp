class Bookedroom < ApplicationRecord
  has_one :user
  has_one :room
  attr_accessor :status
  attr_accessor :user
  attr_accessor :room

  def find_room
  	return Room.where("roomno = " + self.room_id.to_s).first
  end

  def find_user
  	return User.find(self.user_id)
  end

  def to_s
  	return self.find_room.to_s + ", " + self.find_user.to_s
  end
end
