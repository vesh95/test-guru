class AddPkToBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :badges_users, :id, :primary_key
  end
end
