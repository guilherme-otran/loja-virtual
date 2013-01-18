class Sale < ActiveRecord::Base
  attr_accessible :total_price
  
  # Relationships
  belongs_to :user
    
  # Validations
  validates :user, :total_price, presence: true
  validates :total_price, numericality: { only_float: true, greater_than: 0 }
end
