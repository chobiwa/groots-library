class SessionsController < ApplicationController
  def new

  end
  def create
    librarian=Librarian.find_by(email: params[:session][:email].downcase)
    if librarian && (librarian.password==params[:session][:password])
      flash[:notice]="Logged in successfully"
      redirect_to librarian
    else
      flash.now[:alert]="Wrong credentials"
      render 'new'
    end
  end
end