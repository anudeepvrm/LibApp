class Bookedroom < ApplicationRecord
  has_one :user
  attr_accessor :booking_time
end
