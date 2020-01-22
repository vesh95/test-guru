class BadgesService

  ALL_BADGES_RULES = [
  :first_try?,
  :all_level_of?,
  :all_for_category?
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
    return unless @test_passage.success?
    @user.tests.where(id: @test_passage.test.id, test_passages: { success: true}).count == 1
  end

  def all_for_category?(rule_value)
    return if @test_passage.test.category != rule_value

    return unless @test_passage.success?

    last_test = Test.by_category(rule_value).last
    return unless @user.badges_users.older_than_test(last_test).by_rules(__method__, rule_value).empty?

    (Test.by_category(rule_value).pluck(:id) - @user.success_tests.by_category(rule_value).pluck(:id)).empty?
  end

  def all_level_of?(rule_value)
    return if @test_passage.test.level != rule_value.to_i

    return unless @test_passage.success?

    last_test = Test.all.level(rule_value).last
    return unless @user.badges_users.older_than_test(last_test).by_rules(__method__, rule_value).empty?

    (Test.level(rule_value).pluck(:id) - @user.success_tests.level(rule_value).pluck(:id)).empty?
  end
end
