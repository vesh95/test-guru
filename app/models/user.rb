class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :own_tests, class_name: :Test, foreign_key: :author_id, , dependent: :nullify

  # has_secure_password
  def tests_by_level(level)
    tests.where(level: level)
  end
end
