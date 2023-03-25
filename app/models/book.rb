class Book < ApplicationRecord
  belongs_to :shop
  has_many :cart_details
  has_and_belongs_to_many :categories, -> { order('name DESC') }
  validates :shop_id, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :amount, presence: true
end
