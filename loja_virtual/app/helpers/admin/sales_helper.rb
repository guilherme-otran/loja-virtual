module Admin::SalesHelper
	def total_value(sales)
		sales.inject(0) { |memo, sale| memo += sale.total_price }
	end

	def total_number(sales)
		sales.inject(0) { |memo, sale| memo += 1 }
	end

	def username(id)
		User.find(id).name
	end

	def product_category(id)
		product(id).category.name
	end

	def product_description(id)
		product(id).description
	end

	def product_code(id)
		product(id).code
	end

	def product(id)
		Product.find(id)
	end
end