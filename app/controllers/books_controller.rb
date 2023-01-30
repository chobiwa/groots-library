class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]
  before_action :require_librarian, only: [:edit, :update,:new,:create]
  before_action :require_same_librarian, only: [:edit, :update]

  def new
    @book=Book.new
  end
  def create
    @book=Book.new(params.require(:book).permit(:name,:authors,:count))
    if @book.save
      flash[:notice]='Added to library successfully'
      redirect_to @book
    else
      render 'new',status: 401
    end
  end
  def show
    @book=Book.find(params[:id])
  end
  def edit
  end
  def update
    if @book.update(params.require(:book).permit(:name, :authors, :count))
      flash[:notice] = "Book updated successfully."
      redirect_to @book
    else
      render 'edit'
    end
  end
  def index
    @books = Book.all
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  def require_same_librarian
    if current_librarian !=@book.librarian
      flash[:alert] = "You cannot perform these actions"
      redirect_to @book
    end
  end
end
