class Pet < ApplicationRecord
  belongs_to :user
  attachment :pet_image
end
