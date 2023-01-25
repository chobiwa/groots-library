class LibrariansController < ApplicationController
  def show
    @librarian=Librarian.find(params[:id])
  end
end
