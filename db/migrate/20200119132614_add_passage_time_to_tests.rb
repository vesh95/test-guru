class AddPassageTimeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :passage_time, :integer, default: 0
  end
end
