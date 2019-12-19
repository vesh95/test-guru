require 'digest/sha1'

class User < ApplicationRecord
  # has_secure_password

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true
  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def tests_by_level(level)
    tests.level(level)
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(strnig)
    Digest::SHA1.hexdigest(strnig)
  end
end
