class WelcomeController < ApplicationController
	def index
		@products = Product.order('created_at DESC').limit(3);
	end

	def about
		@content = Content.find(1)
	end

	def contact
		@about = Contact.find(1)
	end
end