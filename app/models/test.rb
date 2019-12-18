class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true}

  scope :easy, -> { where(level: 0..1)}
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, -> (level) { where(level: level) }
  scope :by_category, -> (name) { joins(:category).where(categories: { title: name }) }

  def self.names_by_category(name)
    by_category(name).pluck(:title)
  end
end
