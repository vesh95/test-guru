class User < ApplicationRecord
  # has_secure_password
  def tests_by_level(level)
    Test
    .joins("LEFT JOIN user_tests ON tests.id = user_tests.test_id")
    .where(level: level, user_tests: { user_id: id })
  end
end
