class User < ApplicationRecord
  validates :email, :presence => true,:uniqueness => true, if: "self.id == nil"
  validates :password, :presence => true
  validates :name, :presence => true
end
