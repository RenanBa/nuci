require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "Shouldn't save without the product's main attributes" do
    product = Product.new
    assert_not product.save, "Saved a new product without a name, size, price, quantity, description, image_url"
  end
end
