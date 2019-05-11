class User < ApplicationRecord
  include Validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable,
         :registerable, :confirmable, :recoverable

  before_validation :strip_nickname

  has_many :posts, dependent: :destroy

  validates :nickname, presence: true, length: { in: 2..30, **CAN_BE_BLANK },
                       uniqueness: CAN_BE_BLANK

  private

  def strip_nickname
    nickname.strip!
  end
end
