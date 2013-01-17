module ProductFilterPaginator
	def filter_products
		@products = (@products || Product).search(params)
	end

	def paginate_products
		@products = (@products || Product).page(params[:page]).per(8)    
	end
end