class Post < ApplicationRecord
  #mount_uploader :video, VideoUploader
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  acts_as_taggable
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def save_posts(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags
    
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
    
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
  end
end
