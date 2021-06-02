class Post < ApplicationRecord
  #mount_uploader :video, VideoUploader
  attachment :image
  belongs_to :user
end
