class QuestionsController < ApplicationController
  def index
    @questions = Test.find(params[:test_id]).questions.all
    render json: @questions
  end
end
