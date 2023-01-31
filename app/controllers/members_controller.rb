class MembersController < ApplicationController
  before_action :require_librarian, only: [:new,:create]

  def new
    @member = Member.new
  end
  def create
    @member = Member.new(params.require(:member).permit(:name))
    @member.librarian=current_librarian
    if @member.save
      flash[:notice] = "Member was successfully added"
      redirect_to @member
    else
      render 'new',status: 401
    end
  end
  def show
    @member=Member.find(params[:id])
  end

end
