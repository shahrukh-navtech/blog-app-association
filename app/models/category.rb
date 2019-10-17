class Category < ApplicationRecord
	has_and_belongs_to_many :products
	before_destroy do
    products.each { |product| product.destroy }
  end
end
