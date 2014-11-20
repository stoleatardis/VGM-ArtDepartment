class ProductsController < ApplicationController
	def index 
		@products = Product.all
	end

	def show
	end

	def prints
		@products = Product.where("category_id = 1")
	end
end
