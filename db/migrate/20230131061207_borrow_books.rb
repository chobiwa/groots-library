class BorrowBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :member_books do |t|
      t.integer :member_id
      t.integer :book_id
      t.datetime :return_date
      t.timestamps
    end
  end
end
