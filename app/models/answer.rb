class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_1_4_size_validation

  scope :correct, -> { where(correct: true) }

  def answers_1_4_size_validation
    errors.add(:question, 'too many answers') unless question.answers.count < 4
  end
end
