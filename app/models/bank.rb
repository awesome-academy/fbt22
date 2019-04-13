class Bank < ApplicationRecord
  has_many :payments
  belongs_to :user
end
