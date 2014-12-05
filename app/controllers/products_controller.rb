class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]


  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    if not product.user == current_user
      redirect_to category_product_path(category, product)
      flash[:error] = 'You are not allowed to edit this product.'
    end

  end

  def create
      self.product = Product.new(product_params)
      product.user = current_user

      if product.save
        category.products << product
        redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
  end


  def update
    if user_signed_in?
      if product.user == current_user
        if self.product.update(product_params)
          redirect_to category_product_path(category, product)
        else
          render action: 'edit'
        end
      else
        redirect_to category_product_path(category, product)
        flash[:error] = 'You are not allowed to edit this product.'
      end
    else
    end
      




    #if not product.user == current_user
    #  flash[:error] = 'You are not allowed to edit this product.'
    #end
    
    #if self.product.update(product_params)
    #  redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    #else
    #  redirect_to category_product_path(category, product)
      #render action: 'edit'
    #end

  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
