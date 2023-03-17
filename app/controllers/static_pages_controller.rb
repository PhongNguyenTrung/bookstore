class StaticPagesController < ApplicationController
  def home
    @category = Category.all
    @books = Book.all
  end

  def category
    @categories = Category.all
   
    # @books = if params[:category_id].present? && params[:category_id] != '0'
    #            Category.find(params[:category_id]).books
    #          else
    #            Book.all
    #          end
    # @books = @books.order(:title).page(params[:page]).per(12)

    return unless params[:category].present?

    @books = if params[:category] != '0'
                 @category = Category.find(params[:category]).name
                 Category.find(params[:category]).books
               else
                 @category = 'All Categories'
                 Book.all
               end
    if params[:title].present? && (params[:title] != '')
      @books =@books.where('title LIKE ?', "%#{params[:title]}%")
    end
    @show_search = true
    @books = @books.order(:title).page(params[:page]).per(12)
  end
end
