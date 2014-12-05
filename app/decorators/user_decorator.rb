class UserDecorator < Draper::Decorator
  include ActionView::Helpers::AssetTagHelper
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def latest_reviews
	user.reviews.order("created_at").reverse.first(5)
  end

  def number_of_products
  	user.products.length
  end

  def number_of_reviews
  	user.reviews.length
  end

  def gravatar(options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"#?s=#{size}"
    image_tag(gravatar_url, alt: user.firstname, class: "gravatar")
  end
end
