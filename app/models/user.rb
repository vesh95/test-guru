class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end


  # has_secure_password
  def tests_by_level(level)
    tests.level(level)
  end
end
