class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(6)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def products_in_category
    @categories = Category.all
    @products = Category.find(params[:id]).products.order('name')
                .page(params[:page]).per(6)
    render :index
  end

  def search_results
    @categories = Category.all
    wildcard_keywords = "%#{params[:keyword_search]}%"
    if params[:category].present?
      @products = Category.find_by_id(params[:category])
                  .products.where('name LIKE ? or description LIKE ?',
                                  wildcard_keywords, wildcard_keywords)
    else
      @products = Product.where('name LIKE ?', wildcard_keywords)
    end
  end

  def add_product_to_cart
    session[:product_in_cart] = params[:id].to_i
    redirect_to :back
  end

  def checkout
  end

  def customer_checkout
    @provinces = Province.all
    @id = Product.find(params[:id].to_i).id
    # @current_stock_quantity = Product.find(@id).stock_quantity - 1
    # Product.update(@id, stock_quantity: @current_stock_quantity)
    flash.now[:notice] = 'Purchasing ' + Product.find(@id).name
    # session.delete(:product_in_cart)

    add_customer_to_database
  end

  def add_customer_to_database
  end
end
