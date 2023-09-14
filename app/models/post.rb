class Post < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many_attached :images
  has_many :favorites, dependent: :destroy

  validate :images_are_images_not_videos
  validates :images, presence: true
  
  def favorited_by?(user, post, image_id)
    favorites.where(user_id: user.id, post_id: post.id, image_id: image_id).exists?
  end

  def images_are_images_not_videos
    if images.attached?
      images.each do |image|
        unless image.content_type.starts_with?('image/')
          errors.add(:images, 'must be images, not videos')
        end
      end
    end
  end
end
