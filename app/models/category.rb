class Category < ApplicationRecord
  default_scope { order(title: 'ASC')}

  has_many :tests, dependent: :nullify

  validates :title, presence: true
end
