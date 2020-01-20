module Admin::BadgesHelper
  def badges_rules
    BadgesService::ALL_BADGES_RULES.map { |k,v| [v,k]}
  end
end
