class ProductsController < ApplicationController

  def shop
    # optimize to returns the 9 next products instead of all products
    @products = Products.all
    # all categories also
  end

  def all_items
    # all_items should return 9 most popular products of each category
    # it also should return all categories name
  end

end
