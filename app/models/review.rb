class Review < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user
  belongs_to :tour
end
