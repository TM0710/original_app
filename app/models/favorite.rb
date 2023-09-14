class Favorite < ApplicationRecord
  belongs_to :user
  # belongs_to :post
  belongs_to :image, class_name: 'ActiveStorage::Attachment'
end
