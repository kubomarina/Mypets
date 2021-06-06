class Pet < ApplicationRecord
  belongs_to :user
  attachment :pet_image

  def self.search(keyword)
    where(["Animal_name like?", "%#{keyword}%"])
  end
end
