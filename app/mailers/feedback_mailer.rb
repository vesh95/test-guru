class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
          subject: -> { t('.subject') }

  def feedback(feedback)
    @text = feedback.text
    @author = feedback.author
    mail
  end
end
