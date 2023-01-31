class Member < ApplicationRecord
  validates :name ,presence:true ,length: { minimum: 3, maximum: 50 },uniqueness: { case_sensitive: false }
  belongs_to :librarian
  has_secure_password
end