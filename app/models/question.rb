class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validate :answers_1_4_size_validation

  validates :body, presence: true

  private

  def answers_1_4_size_validation
    errors.add(:answers, 'Error answers count') unless answers.size.between?(1, 4)
  end
end
