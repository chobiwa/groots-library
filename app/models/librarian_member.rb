class LibrarianMember < ApplicationRecord
  belongs_to :librarian
  belongs_to :member
end