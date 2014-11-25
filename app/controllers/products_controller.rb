class ProductsController < ApplicationController
	def index 
		@products = Product.order("name").page(params[:page]).per(6)
		@categories = Category.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def products_in_category
		@categories = Category.all
		@products = Category.find(params[:id]).products.order("name").page(params[:page]).per(6)
		render:index
	end

	def search_results
		wildcard_keywords = "%#{params[:keyword_search]}%"
		@products = Product.where('name LIKE ?', wildcard_keywords)
	end
end
