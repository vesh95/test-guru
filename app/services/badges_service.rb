class BadgesService

  ALL_BADGES_RULES = [
  :first_try?
  :all_level_of?
  :all_for_category
]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
  end

  def call
    Badge.all.select do |badge|
      badge if send("#{badge.rule}".to_sym, badge.rule_value)
    end
  end

  private

  def first_try?
    @user.tests.where(id: @test_passage.test.id).count == 1 && @test_passage.success?
  end

  def all_for_category(rule_value)
    @user.tests.where(test_passages: { success: true }).by_category(rule_value)
         .pluck(:id).sort == Test.by_category(rule_value).pluck(:id)
  end

  def all_level_of?(rule_value)
    true if @user.tests.level(1)
                 .where(test_passages: { success: true })
                 .pluck(:id).sort == Test.level(1).pluck(:id)
                 .sort && @test_passage.test.level == 1
  end
end
