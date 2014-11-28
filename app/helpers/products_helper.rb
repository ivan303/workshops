module ProductsHelper
	def average_rating
		sum = 0
		product.reviews.each do |rev|
			sum += rev.rating.to_f
		end
		sum/product.reviews.length
	end
end
