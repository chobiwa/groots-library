class CreateLibrarianMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :librarian_members do |t|
      t.integer :librarian_id
      t.integer :member_id
      t.timestamps
    end
  end
end
