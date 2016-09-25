class Room < ApplicationRecord
  belongs_to :bookedroom
  attr_accessor :status
  attr_accessor :date
  attr_accessor :time
  validates :roomno, :uniqueness => true
end
