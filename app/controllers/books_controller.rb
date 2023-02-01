class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]
  before_action :require_librarian, only: [:edit, :update,:new,:create]
  before_action :require_member, only: [:borrow]
  before_action :require_same_librarian, only: [:edit, :update]

  def new
    @book=Book.new
  end
  def create
    @book=Book.new(params.require(:book).permit(:name,:authors,:count))
    @book.librarian=current_librarian
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
  def borrow
    @book = Book.find(params[:id])
    if @book.count>0
      @mb=MemberBook.new
      @mb.member=current_member
      @mb.book=@book
      @mb.issue_date=Date.today
      if @mb.save
        @book.decrement(:count)
        @book.save!
        puts @book.count
        flash[:notice] = "Borrowed book successfully"
        redirect_to books_path
      end
    else
      flash[:notice]="No available copies"
      redirect_to books_path
    end
  end
  def return_book
    @book = Book.find(params[:id])
    if MemberBook.where(member_id:current_member.id,book_id: @book.id).first.return_date.nil?
      @mb.update(return_date:Date.today)
      @mb.save!
      flash[:notice]="Book returned successfully"
      @book.increment(:count)
      @book.save!
      redirect_to books_path
    else
      flash[:notice]="Book not borrowed"
      redirect_to books_path
    end
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
