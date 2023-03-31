class OrderDetailController < ApplicationController
  def create; end

  def update
    order = OrderDetail.find(params[:id])
    book = Book.find(order.Book_id)
    if order.quantity <= book.amount
      order.update!(status: true)
      book.update!(amount: book.amount - order.quantity)
      redirect_back(fallback_location: shop_path)
      flash[:notice] = "#Order #{order.id} processed successfully!"
    else
      redirect_back(fallback_location: shop_path)
      flash[:alert] = "#{book.title} isn't enough amount in stock!"
    end
  end
end
