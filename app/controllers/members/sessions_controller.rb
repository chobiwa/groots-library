class Members::SessionsController < ApplicationController
  def new
  end
  def create
    member = Member.find_by(name: params[:session][:name])
    if member && member.authenticate(params[:session][:password])
      session[:member_id] = member.id
      flash[:notice] = "Logged in successfully"
      redirect_to member
    else
      flash.now[:alert] = "Wrong credentials"
      render 'new', status: 401
    end
  end
  def destroy
    session[:member_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end
end