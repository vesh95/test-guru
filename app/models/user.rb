class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists

  has_many :badges_users, dependent: :destroy
  has_many :badges, through: :badges_users

  devise :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable,
  :trackable,
  :validatable,
  :confirmable

  def success_tests
    tests.where(test_passages: { success: true })
  end

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
