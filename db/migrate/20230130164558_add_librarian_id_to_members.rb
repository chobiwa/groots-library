class AddLibrarianIdToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :librarian_id, :integer

  end
end
