class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :next_question

  def accept!(answer_ids)
    self. correct_questions += 1 if correct_answer?(answer_ids)
    self.complete_test if time_is_over?
    self.save!
  end

  def completed?
    current_question.nil?
  end

  def complete_test
    self.current_question = nil
    # self.success = self.success? ? true : false
  end

  def correct_percent
    100 / test.questions.count * correct_questions
  end

  def passage_percent
    100 / test.questions.count * current_question_number
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def success?
    correct_percent >= 85
  end


  def left_at
    self.created_at + self.test.passage_time.minutes
  end

  def passage_time?
    true unless self.test.passage_time.zero?
  end

  def secounds_left
    Time.at(left_at - Time.current).strftime("%s")
  end

  private

  def time_is_over?
    Time.current >= self.left_at && self.passage_time?
  end


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
