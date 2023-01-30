class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :authors
      t.integer :count
      t.timestamps
    end
  end
end
