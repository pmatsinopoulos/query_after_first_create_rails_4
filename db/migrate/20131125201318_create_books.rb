class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :isbn,        :null => false
      t.string  :name,        :null => false
      t.string  :author,      :null => false
      t.integer :book_count, :null => false

      t.timestamps
    end
    add_index :books, [:isbn]
  end
end
