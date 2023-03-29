class OrderController < ApplicationController
  def show
    @items = current_cart.cart_details.where(status: true)
    @sub_total = @items.sum{|item| item.total_price}
    @voucher = 0
    @total = @sub_total - @voucher
  end
  def create
    
  end

  private 
  def order_params
    params.require(:order).permit(:status, :total_price, :shipping_address, :payment_method, :order_details[])
  end
end
