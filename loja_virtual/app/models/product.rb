class Product < ActiveRecord::Base
  
  # require 'file_size_validator'
  
  attr_accessible :category_id, :code, :description, :price, :image

  belongs_to :category
  
  mount_uploader :image, ImageUploader
    
  validates :code, uniqueness: true
  validates :code, :price, :category, presence: true
  validates :price, numericality: { only_float: true, greater_than: -0.0 }
  
  validates :image, 
    allow_blank: true, 
    format: {
      with: %r{\.(jpe?g)\z}i,
      message: 'must be a JPG'
    }#,
    # file_size: {
      # maximum: 1.megabytes.to_i
    #}
end
