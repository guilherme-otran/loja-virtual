class Sale < ActiveRecord::Base
	# Mass-storange
	attr_accessible :total_price
	
	# Relationships
	belongs_to :user
	has_many :sale_items
	
	# Validations
	validates :user_id, :total_price, presence: true
	validates :total_price, numericality: { only_float: true, greater_than: 0 }

	# Scopes
	scope :by_between_date, (lambda do |start_date, end_date|
		where 'created_at between ? and ?', start_date, end_date
	end)
end