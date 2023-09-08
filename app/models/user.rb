class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :name
    validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid' }
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :posts
end
