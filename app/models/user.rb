class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  # has_secure_password
  def tests_by_level(level)
    tests.level(level)
  end
end
