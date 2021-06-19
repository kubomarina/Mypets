class Pet < ApplicationRecord
  belongs_to :user
  attachment :pet_image
  
  validates :Animal_name, presence: true

  def self.search(keyword)
    where(["Animal_name like?", "%#{keyword}%"])
  end
end
