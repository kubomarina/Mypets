class User < ApplicationRecord
    validates :owner_name, :pet_kind, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :pets, dependent: :destroy
   has_many :favorited_posts, through: :favorites, source: :user
  attachment :profile_image
  
end
