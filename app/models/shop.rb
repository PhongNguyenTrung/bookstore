class Shop < ApplicationRecord
  # before_action authenticate_user!
  belongs_to :user
  has_many :books, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
  VALID_PHONE_REGEX = /0[0-9]*/
  validates :phone, presence: true, length: { minimum: 8, maximum: 11 }, format: { with: VALID_PHONE_REGEX }
  validates :address, presence: true
  # validates :description, length: { maximum: 140 }
end
