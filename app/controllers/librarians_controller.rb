class LibrariansController < ApplicationController
  def show
    @librarian=Librarian.find(params[:id])
    @books=Book.all
    @members=@librarian.members
  end
  def index
    @librarians=Librarian.all
  end
end
