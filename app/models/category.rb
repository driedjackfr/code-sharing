class Category < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, presence: true

  def style_class
    name == 'tiếng nhật' ? 'japanese' : name
  end
end
