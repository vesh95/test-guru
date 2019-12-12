class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validate :level_validation

  scope :easy, -> { where(level: 0..1)}
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :level, -> (level) { where(level: level) }

  scope :names_by_category, -> (name) do
    joins(:category).where(categories: { title: name }).pluck(:title)
  end

  private

  def level_validation
    errors.add(:level) if level.negative?
  end
end
