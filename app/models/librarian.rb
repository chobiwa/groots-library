class Librarian < ApplicationRecord
  before_save {self.email =email.downcase}
  has_many :books
  validates :name ,presence:true ,length:{minimum:4,maximum: 25},uniqueness: { case_sensitive: false }
  EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email ,presence:true ,length:{minimum:10,maximum: 100},uniqueness: { case_sensitive: false },format: {with:EMAIL_REGEX}
  has_secure_password
  has_many :librarian_members
  has_many :members,through: :librarian_members
end