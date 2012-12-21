class Product < ActiveRecord::Base
  
  attr_accessible :category, :code, :description, :price, :image
  
  mount_uploader :image, ImageUploader
  
  belongs_to :category
  
  validates :code, uniqueness: true
  validates :code, :price, presence: true
  validates :price, numericality: { only_float: true, greater_than: -0.0 }
  
end
