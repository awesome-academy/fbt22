class Tour < ApplicationRecord
  has_many :reviews
  has_many :booking_details
  belongs_to :category
end
