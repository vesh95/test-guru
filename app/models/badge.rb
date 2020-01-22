class Badge < ApplicationRecord
  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :name, :img_name, presence: true
  validates :rule, inclusion: { in: BadgesService::ALL_BADGES_RULES.map(&:to_s) }
end
