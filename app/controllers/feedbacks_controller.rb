class FeedbacksController < ApplicationController
  def show; end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid? && FeedbackMailer.feedback(@feedback).deliver_now
      flash[:notice] = t('.success')
      redirect_to feedback_path
    else
      render :show
    end
  end

  private

  def feedback_params
    params.permit(:text, :author)
  end
end
