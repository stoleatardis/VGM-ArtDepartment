class CategoriesController < ApplicationController
	def prints
		@products = Category.find(params[:name])
	end
end
