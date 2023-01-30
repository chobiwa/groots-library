class Book < ApplicationRecord
  validates :name ,presence:true ,length: { minimum: 3, maximum: 50 }
  validates :authors ,presence:true
  validates :count ,presence:true
end