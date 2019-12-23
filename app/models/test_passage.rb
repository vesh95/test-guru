class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :next_question

  def accept!(answer_ids)
    self. correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def correct_percent
    100 / test.questions.count * correct_questions
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def success?
    correct_percent >= 85
  end

  private

  def correct_answer?(answer_ids)
    return if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = if new_record?
      test.questions.order(:id).first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
