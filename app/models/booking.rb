class Booking < ApplicationRecord
  has_many :booking_details
  belongs_to :user
end
