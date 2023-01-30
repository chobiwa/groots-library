class LibrariansController < ApplicationController
  def show
    @librarian=Librarian.find(params[:id])
  end
  def index
    @librarians=Librarian.all
  end
end
