class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :body

  validates :title, :body, presence: true

  scope :sort_new, -> { order(created_at: :desc) }
end
