class Badge < ApplicationRecord
  validates :name, :img_name, presence: true
end
