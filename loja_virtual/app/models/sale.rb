class Sale < ActiveRecord::Base
	# Mass-storange
	attr_accessor :total_price
	
	# Relationships
	belongs_to :user
	has_many :sale_items
	
	# Validations
	validates :user_id, :total_price, presence: true
	validates :total_price, numericality: { only_float: true, greater_than: 0 }

	# Scopes
	scope :by_created_date, (lambda do |date|
		where created_at: date
	end)
end