class User < ApplicationRecord
  # has_secure_password
  def tests_by_level(level)
    Test.where(level: level).where('users.id = ?', id)
    .joins("LEFT JOIN user_tests ON tests.id = user_tests.test_id")
    .joins("LEFT JOIN users ON users.id = user_tests.user_id")
  end
end
