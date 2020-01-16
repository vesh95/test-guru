class Feedback
  include ActiveModel::Model

  attr_accessor :author, :text

  def id
    nil
  end

  validates :author, :text, presence: true
  validates_format_of :author, with: /\A[^@]+@[^@]+[\.a-zA-Z0-9]\z/i
end
