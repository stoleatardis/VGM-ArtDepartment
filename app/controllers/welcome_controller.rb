class WelcomeController < ApplicationController
	def index
		@products = Product.find(3)
	end
end
