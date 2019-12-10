class AddAuthorToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer, null: true, default: nil
    add_index :tests, :author_id
  end
end
