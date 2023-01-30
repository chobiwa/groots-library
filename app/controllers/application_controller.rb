class ApplicationController < ActionController::Base
  helper_method :current_librarian, :logged_in?

  def current_librarian
    @current_librarian ||= Librarian.find(session[:librarian_id]) if session[:librarian_id]
  end

  def logged_in?
    !!current_librarian
  end
end
