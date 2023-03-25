class CartsController < ApplicationController
  before_action :current_cart
  def show
    @cart_details = current_cart.cart_details
    @sub_total = @cart_details.sum{|cart_detail| cart_detail.total_price}
    @voucher = 0
    @total = @sub_total - @voucher
  end
end
