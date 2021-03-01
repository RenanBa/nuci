class ProductsController < ApplicationController
  # GET /products
  def index
    # optimize to returns the 9 next products instead of all products
    @products = Product.all
    # all categories also
  end

  # GET /product/1
  def show
  end
end
