class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  # has_secure_password
  def tests_by_level(level)
    tests.level(level)
  end
end
