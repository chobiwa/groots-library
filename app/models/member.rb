class Member < ApplicationRecord
  validates :name ,presence:true ,length: { minimum: 3, maximum: 50 },uniqueness: { case_sensitive: false }
  has_many :librarian_members
  has_many :librarians,through: :librarian_members
end