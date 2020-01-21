class BadgesUser < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :older_than_test, -> (test) { where("created_at > ?", test.created_at) }
  scope :by_rules, -> (rule, rule_value) { joins(:badge).where(badges: { rule: rule, rule_value: rule_value }) }
end
