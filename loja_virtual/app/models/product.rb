class Product < ActiveRecord::Base
  # Mass-storange acessors.
  attr_accessible :category_id, :code, :description, :price, :image, :category

  # Relations.
  belongs_to :category
  
  # Uploaders.
  mount_uploader :image, ImageUploader
  
  #Validations
  validates :code,  uniqueness: true
  validates :code, :description, :price, :category_id, presence: true
  validates :code,  numericality: { only_integer: true, greater_than: 0 }
  validates :code,  length: { maximum: 15 }
  validates :price, numericality: { only_float:   true, greater_than: 0 }
  validates :image, 
    allow_blank: true, 
    format: {
      with: %r{\.(jpe?g)\z}i,
      message: 'must be a JPG'
    }
end
