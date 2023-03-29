class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :order_details
end
