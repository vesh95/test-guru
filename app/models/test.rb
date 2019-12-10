class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true
  has_many :user_tests
  has_many :users, through: :user_tests, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.names_by_category(name)
    joins(:category)
    .where(categories: { title: name }).pluck(:title)
  end
end
