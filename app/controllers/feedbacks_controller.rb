class FeedbacksController < ApplicationController
  def show; end

  def create
    if FeedbackMailer.feedback(feedback_params).deliver_now
      flash[:notice] = t('.success')
      redirect_to feedback_path
    else
      flash[:alert] = t('.falure')
      render :show
    end
  end

  private

  def feedback_params
    params.permit(:text, :author, :authenticity_token, :commit)
  end
end
