class AddSuccesToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :success, :boolean
  end
end
