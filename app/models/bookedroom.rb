class Bookedroom < ApplicationRecord
  has_one :user
  has_one :room
  attr_accessor :status
end
