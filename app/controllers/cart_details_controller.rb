class CartDetailsController < ApplicationController
  def create
    @item = current_cart.cart_details.build(cart_detail_params)
    @item[:total_price] = @item[:quantity] * @item.book.price
    if @item.save
      flash[:notice] = 'Added to cart successfully!'
    else
      flash[:alert]  = 'Failed to add to cart!'
    end
    redirect_to book_path @item.book.id
  end

  def update
    @item = current_cart.cart_details.find(params[:id])
    quantity = if params[:quantity].present?
                 params[:quantity]
               else
                 @item.quantity
               end
    status = if params[:status].present?
               params[:status]
             else
               @item.status
             end
    if @item.update(quantity:, status:)
      flash[:notice] = 'Cart has been updated!'
      @item[:total_price] = @item[:quantity] * @item.book.price
      @item.save
    else
      flash[:alert] = 'Failed to update!'
    end
  end

  def destroy
    current_cart.cart_details.find(params[:id]).destroy
    flash[:notice] = 'Delete item successfully!'
  end

  private

  def cart_detail_params
    params.require(:cart_detail).permit(:book_id, :status, :quantity)
  end
end
