class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable
  include UsersHelper
  enum role: {customer: 0, admin: 1}
  scope :sort_by_created_at_desc, ->{order created_at: :desc}
  has_many :reviews, dependent: :destroy
  has_many :banks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :firstname, presence: true,
    length: {maximum: Settings.app.user.first_name_max_length}
  validates :lastname, presence: true,
    length: {maximum: Settings.app.user.last_name_max_length}
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    return unless picture.size > Settings.app.user.image_size_mb.megabytes
    errors.add(:picture, t("users.action.maximum_size_err"))
  end
end
