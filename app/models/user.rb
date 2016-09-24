class User < ApplicationRecord
  belongs_to :bookedroom
  validates :email, :presence => true,:uniqueness => true, if: "self.id == nil"
  validates :password, :presence => true
  validates :name, :presence => true
end
