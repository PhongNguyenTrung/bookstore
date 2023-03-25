class CartDetailsController < ApplicationController
  def create
    @item = current_cart.cart_details.build(cart_detail_params)
    @item[:total_price] = @item[:quantity] * @item.book.price
    if @item.save
      flash[:notice] = 'Added to cart successfully!'
    else
      flash[:alert]  = 'Failed to add to cart!'
    end
  end

  def update; end

  def destroy; end

  private

  def cart_detail_params
    params.require(:cart_detail).permit(:book_id, :status, :quantity)
  end
end
