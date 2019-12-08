class AddCorrectToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean
  end
end
