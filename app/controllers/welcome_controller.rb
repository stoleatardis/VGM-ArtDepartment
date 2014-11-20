class WelcomeController < ApplicationController
	def index
		@products = Product.all.limit(3);
	end

	def about
		@content = Content.find(1)
	end
end