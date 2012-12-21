class Product < ActiveRecord::Base
  attr_accessible :category, :code, :description, :price
  belongs_to :category
end
