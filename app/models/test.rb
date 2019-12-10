class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions
  belongs_to :category

  def self.names_by_category(name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: name }).pluck(:title)
  end
end
