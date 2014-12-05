class ReviewsController < ApplicationController

  expose(:review)
  expose(:product)
  expose(:category)


  def new
  end

  def index
  end

  def create
    self.review = Review.new(review_params)
    review.user_id = current_user.id


    if review.save
      debugger
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      debugger
      flash[:error] = 'Failed to add new review. Check all required fields.'
      redirect_to category_product_url(product.category, product)
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
