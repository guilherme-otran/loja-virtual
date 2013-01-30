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
	
	scope :filter_date, (lambda do |dates|
		if dates
			if dates[:date_start] && dates[:date_end]
				return where 'created_at between ? and ?', 
								Time.zone.parse(dates[:date_start]).utc, 
								Time.zone.parse(dates[:date_end]).utc.tomorrow
			end
			if dates[:date_start]
				return where 'created_at > ?', Time.zone.parse(dates[:date_start]).utc
			end
			if dates[:date_end]
				return where 'created_at < ?', Time.zone.parse(dates[:date_end]).utc.tomorrow
			end
		end
	end)
end