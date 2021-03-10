class CartController < ApplicationController
  before_action :authenticate_user!, except: [:add_to_cart, :view_order]

  def add_to_cart
    product = Product.find(params[:product_id])

    if product.quantity < params[:qty].to_i
      redirect_to product, notice: "Not enough quantity in stock for this product."
    else
      line_item = LineItem.new
      line_item.product_id = params[:product_id].to_i
      line_item.quantity = params[:qty]
    end
    if user_signed_in?
      line_item.customer_key = current_user.id
    else
      line_item.customer_key = remote_ip
    end
    line_item.save

    line_item.line_item_total = line_item.quantity * line_item.product.price
    line_item.save

    redirect_to view_order_path
  end
end
