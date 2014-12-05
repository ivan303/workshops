class ProductDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def pretty_average_rating
  	unless product.average_rating.nan?
  		number_with_precision(average_rating, precision: 2)
  	else
  		"No ratings"
  	end
  end

  def price_with_dollar
    '$' + product.price.to_s
  end

  def owner
    product.user.firstname + ' ' + product.user.lastname
  end


end
