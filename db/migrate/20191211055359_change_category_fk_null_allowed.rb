class ChangeCategoryFkNullAllowed < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :category_id, true
  end
end
