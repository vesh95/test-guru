class FeedbacksController < ApplicationController
  def show; end

  def create
    if feedback_params_valid? && FeedbackMailer.feedback(feedback_params).deliver_now
      flash[:notice] = t('.success')
      redirect_to feedback_path
    else
      flash[:alert] = t('.errors')
      render :show
    end
  end

  private

  def feedback_params
    params.permit(:text, :author, :authenticity_token, :commit)
  end

  def feedback_params_valid?
    return if feedback_params[:text].blank?
    return if feedback_params[:author].blank?
    return if feedback_params[:author] =~ /^[^@]+@[^@]+[\.a-zA-Z0-9]$/
  end
end
