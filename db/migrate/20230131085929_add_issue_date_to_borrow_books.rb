class AddIssueDateToBorrowBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :member_books, :issue_date, :date

  end
end
