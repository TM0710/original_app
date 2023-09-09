class Post < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  has_many :favorites

  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
