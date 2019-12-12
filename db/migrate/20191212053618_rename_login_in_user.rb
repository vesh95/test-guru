class RenameLoginInUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :login, :email
  end
end
