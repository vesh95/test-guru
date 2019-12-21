class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@testguru>}
  layout 'mailer'
end
