class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :link_to, :question, :user, presence: true 
end
