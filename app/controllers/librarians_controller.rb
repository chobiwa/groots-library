class LibrariansController < ApplicationController
  def show
    @librarian=Librarian.find(params[:id])
    @books=@librarian.books.all
  end
  def index
    @librarians=Librarian.all
  end
end
