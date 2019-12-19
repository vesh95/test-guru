require 'digest/sha1'

class User < ApplicationRecord
  # has_secure_password

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def digest(strnig)
    Digest::SHA1.hexdigest(string)
  end

  def tests_by_level(level)
    tests.level(level)
  end
end
