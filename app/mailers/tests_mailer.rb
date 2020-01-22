class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

  def recieved_badge(badge, user)
    @badge = badge
    @user = user

    mail to: @user.email
  end
end
