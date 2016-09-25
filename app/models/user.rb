class User < ApplicationRecord
  belongs_to :bookedroom
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, :presence => true,:uniqueness => true, if: "self.id == nil"
  validates :password, :presence => true
  validates :name, :presence => true
end
