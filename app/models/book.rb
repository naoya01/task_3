class Book < ApplicationRecord
  
  belongs_to :user
  # attachment :image
  
  # validates :shop_name, presence: true
  # validates :image, presence: true


  
end
