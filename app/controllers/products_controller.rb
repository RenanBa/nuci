class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]
  # GET /products
  def index
    # optimize to returns the 9 next products instead of all products
    @products = Product.all
    # all categories also
  end

  # GET /product/1
  def show
  end

  # GET /product/new
  def new
    @product = Product.new
  end

  # GER /product/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.'}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /product/1
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed'}
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :size, :price, :quantity, :color, :description, :rating, :image_url, :category_id)
  end
end
