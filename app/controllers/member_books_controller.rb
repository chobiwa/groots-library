class MemberBooksController < ApplicationController
  before_action :require_librarian, only: [:index]
  def index
    puts current_member
    id=current_member.id
    @member_books=MemberBook.where(:member_id=>id)
  end
  def update
    @member_book = MemberBook.find(params[:id])
    if @book.update(params.require(:book).permit(:name, :authors, :count))
      flash[:notice] = "Book updated successfully."
      redirect_to @book
    else
      render 'edit'
    end
  end
end
