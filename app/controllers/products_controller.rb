class ProductsController < ApplicationController
	def index 
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def paintings
		@products = Product.where('category_id = 1')
		render :index
	end

	def prints
		@products = Product.where('category_id = 2')
		render :index
	end

	def drawings
		@products = Product.where('category_id = 3')
		render :index
	end
end
