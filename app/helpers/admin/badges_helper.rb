module Admin::BadgesHelper
  def badges_rules
    BadgesService::ALL_BADGES_RULES.map { |k| [I18n.t(".rules.#{k}"), k]}
  end

  def rules_translations(badge)
    I18n.t(".rules.#{badge.rule}", value: badge.rule_value )
  end
end
