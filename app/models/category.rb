class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  validates :title, presence: true

  default_scope { order(title: 'ASC')}
end
