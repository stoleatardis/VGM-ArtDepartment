class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :load_cart

  	private

	def load_cart
		if session[:product_in_cart]
			@product_in_cart = Product.find(session[:product_in_cart])
		else
			@product_in_cart = false
		end
	end
end
