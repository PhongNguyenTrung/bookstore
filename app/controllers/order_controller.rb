class OrderController < ApplicationController
  def show
    @items = current_cart.cart_details.where(status: true)
    @sub_total = @items.sum { |item| item.total_price }
    @voucher = 0
    @total = @sub_total - @voucher
    @order = Order.create!(user_id: current_user.id, status: false, total_price: @total)
    @order_details = []
    @items.each do |item|
      @order_detail = OrderDetail.create!(status: false, quantity: item.quantity, total_price: item.total_price,
                                          Book_id: item.book.id, Order_id: @order.id, Shop_id: item.book.shop_id)
      @order_details.push(@order_detail)
    end
    @order.update(order_details: @order_details)
  end

  def create; end

  def update
    order = current_user.orders.find(params[:id])
    order.update!(status: params[:status], shipping_address: params[:shipping_address],
                  payment_method: params[:payment_method])
  end

  def export_bill
    @order = current_user.orders.find(params[:order_id])
  end

  private

  def order_params
    params.require(:order).permit(:status, :total_price, :shipping_address, :payment_method, :order_details[])
  end
end
