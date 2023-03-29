class OrderDetail < ApplicationRecord
  belongs_to :Order
  belongs_to :Book
  belongs_to :Shop
end
