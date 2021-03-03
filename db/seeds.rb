# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
    email: 'test@example.com',
    encrypted_password: 'taawktljask#$tlw4aaglj'
)


item = 1
5.times {
    product = Product.create(
        name: "Neckless",
        size: "M",
        price: 5.0,
        quantity: 3,
        color: "Red",
        description: "Product created on seed file for testing purpose",
        rating: 8,
        image_url: "shop/products/product-"+item.to_s+".jpg",
        category_id: "Jewellery"
    )
    item = item.to_i + 1
}
