class Post < ApplicationRecord
#  validates :title, :image, presence: true
  has_one_attached :video

  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def save_posts(tags)
   current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
   old_tags = current_tags - tags
   new_tags = tags - current_tags

   old_tags.each do |old_name|
     self.tags.delete Tag.find_by(tag_name:old_name)
   end

   new_tags.each do |new_name|
     post_tag = Tag.find_or_create_by(tag_name:new_name)
     self.tags << post_tag
   end
 end

end
