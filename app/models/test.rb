class Test < ApplicationRecord
  def self.names_by_category(name)
    category_id = Category.where(title: name)
    where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end
