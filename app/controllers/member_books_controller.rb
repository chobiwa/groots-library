class MemberBooksController < ApplicationController
  before_action :require_librarian, only: [:index]
  def index
    puts current_member
    id=current_member.id
    @member_books=MemberBook.where(:member_id=>id)
  end
end
