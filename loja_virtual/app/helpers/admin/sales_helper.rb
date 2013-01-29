module Admin::SalesHelper
	def total_value(sales)
		sales.inject(0) { |memo, sale| memo += sale.total_price }
	end

	def total_number (sales)
		sales.inject(0) { |memo, sale| memo += 1 }
	end
end