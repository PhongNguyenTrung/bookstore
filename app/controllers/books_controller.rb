class BooksController < ApplicationController
  before_action :current_shop
  def new; end

  def edit
    @book = @current_shop.books.find(params[:id])
  end

  def create
    @book = @current_shop.books.build(book_params)
    if @book.save
      flash[:notice] = 'Book created successfully!'
      redirect_to shop_path(@current_shop)
    else
      flash[:alert] = 'Failed to create! Please make sure Title, Price, Amount field not empty!'
      redirect_to shop_path(@current_shop)
    end
  end

  def update
    @book = @current_shop.books.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book has been updated!'
      redirect_to shop_path @current_shop
    else
      flash[:alert] = 'Failed to update!'
      render 'edit'
    end
  end

  def destroy
    @current_shop.books.find(params[:id]).destroy
    flash[:notice] = 'Book has been deleted!'
    redirect_to shop_path @current_shop
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :year, :amount, :descrition, :img_url)
  end

  def current_shop
    @current_shop = Shop.find(params[:shop_id])
  end
end
