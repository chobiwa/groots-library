class ApplicationController < ActionController::Base
  helper_method :current_librarian, :librarian_logged_in?,:current_member,:member_logged_in?

  def current_librarian
    @current_librarian ||= Librarian.find(session[:librarian_id]) if session[:librarian_id]
  end

  def librarian_logged_in?
    !!current_librarian
  end
  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  def member_logged_in?
    !!current_member
  end
  def require_librarian
    if !librarian_logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to librarian_login_path
    end
  end
end
