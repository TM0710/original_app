class Post < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many_attached :images
  has_many_attached :videos
  has_many :favorites, dependent: :destroy

  validate :images_contain_only_images
  validate :videos_contain_only_videos
  validates :images, presence: true, unless: :was_attached?
  
  def favorited_by?(user, post, image_id)
    favorites.where(user_id: user.id, post_id: post.id, image_id: image_id).exists?
  end

  def was_attached?
    self.videos.attached?
  end

  def images_contain_only_images
    if images.attached?
      images.each do |image|
        unless image.content_type.starts_with?('image/')
          errors.add(:images, '写真フォームには写真のみ投稿できます')
        end
      end
    end
  end

  def videos_contain_only_videos
    if videos.attached?
      videos.each do |video|
        unless video.content_type.starts_with?('video/')
          errors.add(:videos, '動画フォームには動画のみ投稿できます')
        end
      end
    end
  end

end
