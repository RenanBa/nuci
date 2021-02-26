class ProductsController < ApplicationController
  def index
    # optimize to returns the 9 next products instead of all products
    @products = Product.all
    # all categories also
  end
end
