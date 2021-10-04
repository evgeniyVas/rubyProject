class News < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true, length: {minimum: 10}
  validates :edit_counter, numericality: { less_than_or_equal_to: 5, message: "exceeded"  }

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
