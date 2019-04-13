class User < ApplicationRecord
  has_many :reviews
  has_many :banks
  has_many :bookings
  has_many :comments
  has_many :likes
end
