class LibrariansController < ApplicationController
  before_action :require_same_librarian, only: [:show]
  def show
    @librarian=Librarian.find(params[:id])
  end
  def index
    @librarians=Librarian.all
  end

  private
  def require_same_librarian
    if current_librarian != @librarian
      redirect_to librarians_path
    end
  end
end
