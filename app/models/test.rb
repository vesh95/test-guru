class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id, optional: true

  def self.names_by_category(name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: name }).pluck(:title)
  end
end
