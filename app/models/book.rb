class Book < ApplicationRecord
  belongs_to :librarian
  validates :name ,presence:true ,length: { minimum: 3, maximum: 50 },uniqueness: { case_sensitive: false }
  validates :authors ,presence:true
  validates :count ,presence:true
end