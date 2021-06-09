class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy
  has_many :posts, through: :tag_maps

def self.search(keyword)
    where(["tag_name like?", "%#{keyword}%"])
  end
end
