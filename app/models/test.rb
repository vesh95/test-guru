class Test < ApplicationRecord
  def self.names_by_category(name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: name }).pluck(:title)
  end
end
