class SessionsController < ApplicationController
  def new

  end
  def create
    librarian = Librarian.find_by(email: params[:session][:email].downcase)
    if librarian && librarian.authenticate(params[:session][:password])
      session[:librarian_id] = librarian.id
      flash[:notice] = "Logged in successfully"
      redirect_to librarian
    else
      flash.now[:alert] = "Wrong credentials"
      render 'new', status: 401
    end
  end
  def destroy
    session[:librarian_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end
end