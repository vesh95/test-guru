class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy]
  before_action :set_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
    render json: @questions
  end

  def show
    render inline: "<%= link_to @question.body, @question, method: :delete %>", layout: :default
  end

  def new
  end

  def create
    if @test.questions.create(question_params)
      redirect_to test_questions_path(@test)
    else
      render plain: @rest.errors.each
    end
  end

  def destroy
    if @question.destroy
      render plain: 'Success removed'
    else
      render plain: 'Remove errors'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
