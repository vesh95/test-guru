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
    return if @test_passage.test.category.title != rule_value
    return unless @test_passage.success?
    (
      Test.by_category(rule_value).pluck(:id) -
      new_passages(last_badge_date_by_rules(__method__, rule_value)).ids
    ).empty?
  end

  def all_level_of?(rule_value)
    return if @test_passage.test.level != rule_value.to_i
    return unless @test_passage.success?

    (
      Test.level(rule_value).pluck(:id) -
      new_passages(last_badge_date_by_rules(__method__, rule_value)).ids
    ).empty?
  end

  private

  def last_badge_date_by_rules(rule, rule_value)
    @user.badges_users.by_rules(rule, rule_value).order(:created_at).last.try(:created_at)
  end

  def new_passages(last_date)
    return @user.success_tests if last_date.nil?
    @user.success_tests.where('test_passages.created_at > ?', last_date)
  end
end
