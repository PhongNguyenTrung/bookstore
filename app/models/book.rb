class Book < ApplicationRecord
  belongs_to :shop
  validates :shop_id, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :amount, presence: true
end
