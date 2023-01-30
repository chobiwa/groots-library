class MembersController < ApplicationController
  before_action :require_librarian, only: [:new,:create]
  # before_action :require_same_librarian, only: [:edit, :update]

  def new
    @member = Member.new
  end
  def create
    @member = Member.new(params.require(:member).permit(:name))
    if @member.save
      flash[:notice] = "Member was successfully added"
      redirect_to @member
    else
      render 'new',status: 401
    end
  end
end
