class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[edit show update destroy]
  before_action :set_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_test_path(@question.test) if @question.destroy
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
