class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :posts, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :host_id
    validates :wedding_day
    validates :room_path, uniqueness: { message: 'は既に使用されています' }
  end
end
