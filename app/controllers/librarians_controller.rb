class LibrariansController < ApplicationController
  def show
    @librarian=Librarian.find(params[:id])
    @books=Book.all
    @members=Member.all
  end
  def index
    @librarians=Librarian.all
  end
end
