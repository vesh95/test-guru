class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Test.find(params[:test_id]).questions.all
    render json: @questions
  end

  def show
    render json: { question: @question, answers: @question.answers }
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
