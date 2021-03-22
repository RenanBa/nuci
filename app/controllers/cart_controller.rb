class CartController < ApplicationController
  before_action :authenticate_user!, except: [:add_to_cart, :view_order]

  def add_to_cart
    # If user add to cart from products page or store_front page the quantity
    # will be nil. In this case we set the quantity to 1
    params[:qty] = 1 if params[:qty] == nil

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

      # At this point we also need a Order to link the LineItem with. So we will
      # create one order before saving the LineItem
      order = Order.new
      order.user_id = line_item.customer_key
      order.save!
      # Now we can save LineItem with the newly created order
      line_item.order_id = order.id
      line_item.save

      line_item.line_item_total = line_item.quantity * line_item.product.price
      line_item.save

      redirect_to view_order_path

    else
      redirect_to new_user_session_path, notice: "You must be logged in to add products to your cart."
      # line_item.customer_key = "127.0.0.1" #need remote_ip function to return IP
    end
  end

  def view_order
    @line_items = LineItem.where(customer_key: current_user.id)
  end
end
