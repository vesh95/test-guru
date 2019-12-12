class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0}

  scope :easy, -> { where(level: 0..1)}
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :level, -> (level) { where(level: level) }

  scope :names_by_category, -> (name) do
    joins(:category).where(categories: { title: name }).pluck(:title)
  end
end
