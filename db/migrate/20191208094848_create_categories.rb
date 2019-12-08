class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, limit: 20

      t.timestamps
    end
  end
end
