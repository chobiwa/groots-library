class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  def create
    @book=Book.new(params.require(:book).permit(:name,:authors,:count))
    if @book.save
      flash[:notice]='Added to library successfully'
      redirect_to @book
    else
      render 'new'
    end
  end
  def show
    @book=Book.find(params[:id])
  end
end
