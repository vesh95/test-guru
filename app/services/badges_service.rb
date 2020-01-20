class BadgesService

  ALL_BADGES_RULES = {
    first_try?: I18n.t('.rules.first_try'),
    backend_passed?: I18n.t('.rules.backend_passed'),
    all_level_one?: I18n.t('.rules.all_level_one'),
    frontend_passed?: I18n.t('.rules.frontend_passed')
  }

  def initialize(test_passage, user)
    @test_passage = test_passage
    @user = user
    @added_badges = []
  end

  def call
    Badge.all.each do |badge|
      @added_badges << badge if send("#{badge.rule}".to_sym)
    end
    @user.badges << @added_badges
    @added_badges
  end

  private

  def first_try?
    true if @user.tests
                 .where(id: @test_passage.test.id)
                 .count == 1 && @test_passage.success?
  end

  def backend_passed?
    true if @user.tests.where(test_passages: { success: true }).by_category('Backend')
                 .pluck(:id).uniq
                 .sort == Test.by_category('Backend')
                 .pluck(:id).uniq
                 .sort
  end

  def frontend_passed?
    true if @user.tests.where(test_passages: { success: true }).by_category('Frontend')
                 .pluck(:id).uniq
                 .sort == Test.by_category('Frontend')
                 .pluck(:id).uniq
                 .sort
  end

  def all_level_one?
    true if @user.tests.level(1)
                 .where(test_passages: { success: true })
                 .pluck(:id).sort == Test.level(1).pluck(:id)
                 .sort && @test_passage.test.level == 1
  end
end
