class CreateJoinTableUserAchievements < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :badges
  end
end
