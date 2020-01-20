class BadgesNotifyService
  def initialize(badges, user)
    @user = user
    @badges = badges || []
  end

  def call
    unless @badges.count.zero?
      @badges.each do |badge|
        TestsMailer.recieved_badge(badge, @user).deliver_now
      end
    end
  end
end
