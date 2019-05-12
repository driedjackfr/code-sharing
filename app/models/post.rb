class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true

  has_rich_text :body

  validates :title, :body, presence: true

  scope :sort_new, -> { order(created_at: :desc) }

  def created_datetime
    created_at.strftime('%d/%m/%Y %T')
  end
end
