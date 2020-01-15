class FeedbackMailer < ApplicationMailer
  def feedback(feedback_params)
    @text = feedback_params[:text]
    @author = feedback_params[:author]
    mail to: Admin.first.email, subject: t('.subject')
  end
end
