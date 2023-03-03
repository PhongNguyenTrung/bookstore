class ShopsController < ApplicationController
  before_action :authenticate_user!
  def new
    @shop = current_user.shops.build
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      flash[:notice] = 'Shop created!'
      redirect_to @shop
    else
      flash[:alert] = 'Failed to create!'
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = 'Shop has been updated!'
      redirect_to showAll_path
    else
      flash[:alert] = 'Failed to update!'
      render 'edit'
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @books = @shop.books
    # puts(@books)
  end

  def showAll; end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:notice] = 'Deleted successfully!'
    redirect_to showAll_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :tax_code, :description)
  end
end
