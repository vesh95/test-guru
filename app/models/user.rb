class User < ApplicationRecord

  has_and_belongs_to_many :badges

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists

  devise :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable,
  :trackable,
  :validatable,
  :confirmable

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def tests_by_level(level)
    tests.level(level)
  end

  def admin?
    is_a?(Admin)
  end
end
