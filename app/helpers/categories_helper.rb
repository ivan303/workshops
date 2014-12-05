module CategoriesHelper
	def get_color num
		case num
			when 0
				'background: #0099ff'
			when 1
				'background: #49C1D1'
			when 2
				'background: #49C1D1'
			when 3
				'background: #0099ff'
		end
	end

	def best_rated_products
		category.products.select do |product|
			not product.average_rating.nan?
		end.sort_by do |product|
			product.average_rating
		end.reverse.first(5)
	end
end
